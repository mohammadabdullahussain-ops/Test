/// <summary>
/// Table Changes (ID 50002).
/// </summary>
table 50002 Changes
{
    Caption = 'Changes Table';
    DataClassification = CustomerContent;
    DataPerCompany = true;
    DataCaptionFields = ID, Name;

    fields
    {
        field(1; ID; Code[20])
        {
            Caption = 'ID';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; Gender; Enum "Gender")
        {
            Caption = 'Gender';
        }
        field(4; Fee; Decimal)
        {
            Caption = 'Fee';
        }
        field(6; "Submitted ID Proof"; Boolean)
        {
            Caption = 'Submitted ID Proof';
            DataClassification = CustomerContent;
        }
        field(7; "Phone No"; Text[30])
        {
            ExtendedDatatype = PhoneNo;
            Caption = 'Phone No';
            DataClassification = CustomerContent;
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
        field(10; Count; Integer)
        {
            Caption = 'Counting Number';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; ID, Count)
        {
            Clustered = true;
        }
        key(SK; Name, "Phone No")
        {

        }
    }
}
