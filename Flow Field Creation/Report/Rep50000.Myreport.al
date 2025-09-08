/// <summary>
/// Report Myreport (ID 50000).
/// </summary>
report 50000 Myreport
{
    ApplicationArea = All;
    Caption = 'Myreport';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    WordLayout = 'layouts/Test.docx';
    RDLCLayout = 'layouts/Test.rdl';
    //WordMergeDataItem = Test;
    //Previewmode = Normal;


    dataset
    {
        dataitem(Test; Test)
        {
            column(ID; ID)
            {
            }
            column(Name; Name)
            {
            }
            column(PhoneNo; "Phone No")
            {
            }
            column(JoiningTime; "Joining Time")
            {
            }
            column(JoiningDate; "Joining Date")
            {
            }
            column(TotalMarks; "Total Marks")
            {
            }
            column(Email; Email)
            {
            }
            column(Picture1; Picture1)
            {
            }
            column(companylogo; companyinfo.Picture) { }
            dataitem(Marks; Marks)
            {
                DataItemLink = "Student ID" = field(ID);
                column(Subject; Subject)
                {
                }
            }
            /*  dataitem("Company Information"; "Company Information")
             {
                 column(Picture; Picture) { }
             } */
            trigger OnAfterGetRecord()
            begin
                SetAutoCalcFields(Picture1);
                Message('ON AFTER GET RECORD');
            end;

            trigger OnPreDataItem()
            begin
                companyinfo.CalcFields(Picture);
                Message('ON PRE DATA ITEM');
            end;

            trigger OnPostDataItem()
            begin
                Message('ON POST DATA ITEM');
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field("show all fields"; "show all fields")
                    {
                    }
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    trigger OnInitReport()
    begin
        Message('ONINIT REPORT ');
    end;
    //trigger OnPreRendering(var RenderingPayload: JsonObject)          ////BC26
    trigger OnPreReport()
    begin
        Message('ON PRE REPORT');
    end;

    trigger OnPostReport()
    begin
        Message('ON POST REPORT');
    end;

    var
        "show all fields": Boolean;
        companyinfo: Record "Company Information";
}