/// Table Test  (ID 50000).
table 50000 "Test"
{
    Caption = 'Test ';
    DataClassification = CustomerContent;
    DataCaptionFields = ID, Name;
    // LookupPageId = "Test List";
    // DrillDownPageId = "Test List";

    fields
    {
        field(1; ID; Code[20])
        {
            Caption = 'ID';
            trigger OnValidate()
            begin
                if ID <> xRec.ID then begin
                    Testsetup.Get();
                    Nosrsmng.TestManual(Testsetup."ID No");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
            trigger OnLookup()
            var
                myInt: text;
                instr: InStream;
                tempblob: Codeunit "Temp Blob";
            begin
                UploadIntoStream('Choose File', '', '', myInt, instr);
            end;
        }
        field(3; "Fee"; Decimal)
        {
            Caption = 'Fee';
        }
        field(4; "Total Marks"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = sum(Marks.Marks where("Student ID" = field("ID"), Subject = field("Subject filter")));
            Caption = 'Total Marks';

        }
        field(5; "Gender"; Enum GenderTest)
        {

            //OptionMembers = "","Male","Female";
            DataClassification = CustomerContent;
            //Enabled = false;
        }
        field(6; "Submitted ID Proof"; Boolean)
        {
            Caption = 'Submitted ID Proof';
            DataClassification = CustomerContent;
        }
        field(7; "Phone No"; Text[30])
        {
            Caption = 'Phone No';
            DataClassification = CustomerContent;
            // trigger OnValidate()
            // begin
            //     if Isvalidphoneno() then
            //         Message('Phone No is Valid')
            // end;
            trigger OnValidate()
            var
                TyperHelper: Codeunit "Type Helper";
            begin
                if not TyperHelper.IsPhoneNumber("Phone No") then
                    FieldError("Phone No", 'PhoneNo Cannot Contain Letters Error');
            end;
        }
        field(8; "Joining Date"; Date)
        {
            Caption = 'Joining Date';
            DataClassification = CustomerContent;
        }
        field(9; "Joining Time"; Time)
        {
            Caption = 'Joining Time';
            DataClassification = CustomerContent;
        }
        field(10; "Subject filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(11; Email; Text[100])
        {
            DataClassification = CustomerContent;
            // trigger OnValidate()
            // begin
            //     if not Isvalidemail() then
            //         FieldError(Email, 'Email is not valid');
            // end;
            trigger OnValidate()
            var
                mycd3: Codeunit "Mail Management";
            begin
                if mycd3.CheckValidEmailAddress("Email") then
                    Message('Email address is correct')
                else
                    Message('Email Address is not correct');
            end;
        }
        field(12; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(13; Picture1; Blob)
        {
            Caption = 'Picture';
            DataClassification = CustomerContent;
            Subtype = Bitmap;

        }

    }
    keys
    {
        key(pk; ID)
        {
            Clustered = true;

        }
    }
    trigger OnInsert()
    begin
        if ID = '' then begin
            Testsetup.Get();
            Testsetup.TestField("ID No");
            //Nosrsmng.InitSeries(Testsetup."ID No", xRec."No. Series", 0D, ID, Testsetup."ID No");
            ID := Nosrsmng.GetNextNo(Testsetup."ID No", 0D);
        end;
    end;

    var
        Testsetup: Record "Test Setup";
        //Nosrsmng: Codeunit NoSeriesManagement;
        Nosrsmng: Codeunit "No. Series";

    internal procedure Isvalidemail(): Boolean
    begin
        exit(rec.Email.Contains(rec.Email.ToLower()) and rec.Email.Contains('@') and rec.Email.Contains('.') and (StrLen(rec.Email) > 5));
    end;

    internal procedure Isvalidphoneno(): Boolean
    begin
        if not rec."Phone No".StartsWith('+91 ') then
            Error('Phone Number should start with + sign');
        if not (StrLen(rec."Phone No") = 14) then
            Error('Phone Number is not valid');
        exit(rec."Phone No".StartsWith('+91 ') and (StrLen(rec."Phone No") = 14) and rec."Phone No".Contains('+0123456789 '));
    end;

}
