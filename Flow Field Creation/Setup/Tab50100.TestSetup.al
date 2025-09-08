/// <summary>
/// Table Test Setup (ID 50100).
/// </summary>
table 50200 "Test Setup"
{
    Caption = 'Test Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "ID No"; Code[20])
        {
            Caption = 'ID No';
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
