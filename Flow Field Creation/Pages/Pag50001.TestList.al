/// <summary>
/// Page Test List (ID 50001).
/// </summary>
page 50001 "Test List"
{
    ApplicationArea = All;
    Caption = 'Test List';
    PageType = List;
    SourceTable = "Test";
    UsageCategory = Lists;
    CardPageId = "Test Card";
    MultipleNewLines = true;
    //DataCaptionExpression = 'Gender';
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(ID; Rec.ID)
                {
                    ToolTip = 'Specifies the value of the ID field.', Comment = '%';
                    //CharAllowed = 'AZ';
                    Style = Favorable;
                    StyleExpr = true;
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                    trigger OnDrillDown()
                    var
                        vartest: Record Marks;
                    begin
                        if Rec.Get(rec.ID) then
                            Run(page::"Marks List", vartest, vartest."Student ID");
                    end;

                }
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the value of the Gender field.', Comment = '%';
                    //Enabled = false;
                }
                field("Phone No"; Rec."Phone No")
                {
                    ToolTip = 'Specifies the value of the Phone No field.', Comment = '%';
                    trigger OnAssistEdit()
                    var
                        Vartestrec: Record Test;
                    begin
                        if page.RunModal(page::"Test List", Vartestrec) = Action::LookupOK then
                            rec.ID := Vartestrec.ID;
                    end;
                }
                field("Email"; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                }
                field("Joining Date"; Rec."Joining Date")
                {
                    ToolTip = 'Specifies the value of the Joining Date field.', Comment = '%';
                }
                field("Joining Time"; Rec."Joining Time")
                {
                    ToolTip = 'Specifies the value of the Joining Time field.', Comment = '%';
                }
                field(Fee; Rec.Fee)
                {
                    ToolTip = 'Specifies the value of the Fee field.', Comment = '%';
                }
                field("Submitted ID Proof"; Rec."Submitted ID Proof")
                {
                    ToolTip = 'Specifies the value of the Submitted ID Proof field.', Comment = '%';

                }
                field("Total Marks"; Rec."Total Marks")
                {
                    ToolTip = 'Specifies the value of the Total Marks field.', Comment = '%';
                }
                field("Picture"; Rec."Picture1")
                {
                    ToolTip = 'Specifies the value of the Picture field.', Comment = '%';
                }
            }
        }
    }
    // actions
    // {
    //     area(Processing)
    //     {
    //         action("Marks List")
    //         {
    //             ApplicationArea = All;
    //             trigger OnAction()
    //             var
    //                 Test: Record Marks;
    //                 Actiondone: Action;
    //                 Tes1: Page "Marks List";
    //             begin
    //                 Clear(Tes1);
    //                 if Rec.ID = '405' then
    //                     Actiondone := page.RunModal(page::"Marks List");
    //                     Message(Format(Actiondone));
    //                 if Actiondone = Action::LookupOK then
    //                     Message(Format('Marks List Closed'));
    //             end;
    //         }
    //     }
    //}
    // actions
    // {
    //     area(Processing)
    //     {
    //         action("Open Marks List")
    //         {
    //             ApplicationArea = All;
    //             trigger OnAction()
    //             var
    //                 ActionResult: Action;
    //             begin
    //                 ActionResult := Page.RunModal(Page::"Marks List");
    //                 case ActionResult of
    //                     Action::OK:
    //                         Message('User clicked OK');
    //                     Action::LookupOK:
    //                         Message('User selected a record');
    //                     Action::Cancel:
    //                         Message('User cancelled the page');
    //                     Action::LookupCancel:
    //                         Message('User Closed With esc');
    //                 end;
    //             end;
    //         }
    //     }
    // }
    actions
    {
        area(Processing)
        {
            action("Edit Mark Card")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    MyCardPage: Page "Marks Card";
                    Result: Action;
                begin
                    Rec.SetRecFilter; // Open modal for current selected record
                    Result := PAGE.RunModal(PAGE::"Marks Card");
                    if Result = Action::OK then
                        Message('The record was updated with OK action.');
                    if Result = Action::Cancel then
                        Message('User canceled or closed without OK.');
                end;
            }
            action(Date)
            {
                ApplicationArea = All;
                Image = Calendar;

                trigger OnAction()
                var
                    mycd: Codeunit Mysimpletest;
                    Test: Date;
                    ex, ex1 : Integer;
                    t, t1 : Integer;
                begin
                    Test := mycd.Todaydate();
                    Message('Normal Today Date : %1', Test);
                    mycd.formattedDate();
                    t := 10;
                    ex := mycd.passbyvalue(t);
                    Message('original :%1 \ result :%2', t, ex);
                    ex := mycd.passbyvalue(t);
                    Message('original :%1 \ result :%2', t, ex);
                    t1 := 20;
                    ex1 := mycd.passbyref(t1);
                    Message('Updated Variable Value : %1', t1);
                    ex1 := mycd.passbyref(t1);
                    Message('Updated Variable Value : %1', t1);
                end;
            }
            action(post)
            {
                Caption = 'Post';
                ApplicationArea = All;
                Image = Post;
                trigger OnAction()
                begin
                    if rec.Get(rec.ID) then
                        rec.Delete();

                end;
            }
            action(Selectstrmenu)
            {
                Caption = 'Select str menu';
                ApplicationArea = All;
                Image = Select;
                trigger OnAction()
                var
                    SelectionHandler: Codeunit MySelectstrmenu;
                begin
                    SelectionHandler.ShowStrMenu();
                    Message('You selected option %1', SelectionHandler.GetSelectedOption());
                end;
            }
              action(salesreport)
              {
                  Caption = 'Sales Report';
                  ApplicationArea = All;
                  Image = Report;
                  Promoted = true;
                  PromotedCategory = Process;
                  PromotedOnly = true;
                  //RunObject = report MySalesReport;
                  trigger OnAction()
                  var
                      SalesHeader: Record "Sales Header";
                  begin
                      SalesHeader.SetRange("Document Type", SalesHeader."Document Type");
                      SalesHeader.SetRange("No.", SalesHeader."No.");
                  Report.Run(report::MySalesReport, true, true, SalesHeader)
                  end;
              }
        }
    }
    // trigger OnOpenPage()
    // var
    //     recref: RecordRef;
    //     fieldr: FieldRef;
    //     OK: Boolean;
    // begin
    //     recref.Open(50000);
    //     fieldr := recref.Field(4);
    //     fieldr.CalcField();
    //     Message(Format(fieldr.Value));
    //     recref.Open(Database::Marks);
    //     fieldr := recref.Field(1);
    //     OK := fieldr.Active;                       //////FIELDREF.ACTIVE
    //     Message(Format(OK));
    //     Message(Format(fieldr.Name));              /////FIELDREF.NAME
    //     Message(Format(fieldr.Number));            ////FIELDREF.NUMBER
    //     if recref.FindSet() then
    //         repeat
    //             Message(Format(fieldr.Value));      //////FIELDREF.VALUE
    //         until recref.Next() = 0;
    // end;
    // trigger OnOpenPage()
    // var
    //     recref: RecordRef;
    //     fieldr: FieldRef;
    //     OK: Boolean;
    // begin
    //     recref.Open(50000);
    //     fieldr := recref.Field(4);
    //     if recref.FindSet() then
    //         repeat
    //             fieldr.CalcField();                  ///FIELDREF.CALCFIELD
    //             Message(Format(fieldr.Value));
    //         until recref.Next() = 0;
    // end;
    // trigger OnOpenPage()
    // var
    //     recref: RecordRef;
    //     fieldr: FieldRef;
    //     OK: Boolean;
    // begin
    //     recref.Open(50000);
    //     fieldr := recref.Field(3);
    //     OK := fieldr.CalcSum();                ///FIELDREF.CALCSUMS
    //     Message(Format(OK));
    //     Message(Format(fieldr.Value));
    //     fieldr := recref.Field(2);
    //     Message(Format(fieldr.Caption));     /////FIELDREF.CAPTION
    // end;
    // trigger OnOpenPage()
    // var
    //     Recref: RecordRef;
    //     fieldr: FieldRef;
    // begin
    //     Recref.Open(50000);
    //     fieldr := Recref.Field(3);       ////NORMAL
    //     fieldr := Recref.Field(4);       ///FLOW FIELD
    //     fieldr := Recref.Field(10);      ////FLOW FILTERS
    //     Message(Format(fieldr.Class));       //////FIELDREF.CLASS
    // end;
    // trigger OnOpenPage()
    // var
    //     recref: RecordRef;
    //     fieldr: FieldRef;
    // begin
    //     recref.Open(50000);
    //     fieldr := recref.Field(5);
    //     Message(Format(fieldr.EnumValueCount()));          ///FIELDREF.ENUM VALUE COUNT
    //     Message(Format(fieldr.GetEnumValueCaption(2)));     ////INDEX VALUES OF OPTION MEMBER
    //     Message(Format(fieldr.GetEnumValueCaptionFromOrdinalValue(2))); ////ORDINAL VALUE STARTS FROM 0
    //     Message(Format(fieldr.GetEnumValueOrdinal(1))); ////ORDINAL VALUE
    //     Message(Format(fieldr.GetEnumValueName(2)));  /////STARTS FROM 1 INDEX
    //     Message(Format(fieldr.GetEnumValueNameFromOrdinalValue(1))); ////STARTS FROM 0 ORDINAL 
    // end;
    // trigger OnOpenPage()
    // var
    //     recref: RecordRef;
    //     fieldr: FieldRef;
    // begin                ///////SET RANGE, SET FILTER, GET RANGE MAX & MIN, GET FILTER
    //     recref.Open(50000);
    //     fieldr := recref.Field(1);
    //     fieldr.SetRange('401','404');
    //     fieldr.SetFilter('>404 & <408');
    //     if recref.FindSet() then
    //         repeat
    //             Message(Format(fieldr.Value));
    //         until recref.Next() = 0;
    //     Message(Format(fieldr.GetRangeMax));
    //     Message(Format(fieldr.GetRangeMin));
    //     Message(Format(recref.GetFilter));
    // end;
    // trigger OnOpenPage()
    // var
    //     recref: RecordRef;
    //     fieldr: FieldRef;
    // begin                       /////IS ENUM
    //     recref.Open(50000);
    //     fieldr := recref.Field(5);
    //     Message(Format(fieldr.OptionCaption));      ////FIELDREF.OPTIONMEMBERS,OPTIONCAPTION,OPTIONSTRING
    //     Message(Format(fieldr.OptionString));
    //     Message(Format(fieldr.OptionMembers));
    //     Message(Format(fieldr.IsEnum));
    //     //Message(Format(fieldr.Length));           ///FIELDREF.LENGTH
    // end;
    // trigger OnOpenPage()
    // var
    // recref : RecordRef;
    // fieldr : FieldRef;
    // fieldre: RecordRef;
    // begin
    //     recref.Open(50000);
    //     fieldr:= recref.Field(1);
    //     fieldr.Value:= '401';
    //     fieldre:= fieldr.Record();                  ///FIELDREF.RECORD
    //     Message(Format(fieldre.Number));
    // end;
    // trigger OnOpenPage()
    // var
    //     recref: RecordRef;
    //     fieldr: FieldRef;
    // begin
    //     recref.Open(50001);
    //     fieldr := recref.Field(1);          ////FIELDREF.RELATION
    //     Message(Format(fieldr.Relation));
    //     Message(Format(fieldr.Type));        ////FIELDRER.TYPE
    // end;
    // trigger OnOpenPage()
    // var
    //     RecRef: RecordRef;
    //     varKeyRef: KeyRef;
    //     VarCount: Integer;
    //     VarFieldRef: FieldRef;
    //     IsActive: Boolean;
    // begin
    //     RecRef.Open(50001);
    //     varKeyRef := RecRef.KeyIndex(2);        ///RECORD REF.KEYINDEX  
    //     VarCount := varKeyRef.FieldCount;       /////KEY REF.FIELD COUNT
    //     Message('The number of fields defined in the key is: %1', VarCount);
    //     varFieldRef := varKeyRef.FieldIndex(2);     ////KEYREF.FIELD INDEX
    //     Message('The Field name is: %1', varFieldRef.Caption);
    //     IsActive := varKeyRef.Active;
    //     Message('Is the key active =  %1 ', IsActive);
    //     RecRef := varKeyRef.Record;    
    //     Message(Format(RecRef.Number));  /////KEYREF.RECORD
    // end;
    // trigger OnOpenPage()
    // var
    //     RecRef: RecordRef;
    //     RecID: RecordID;
    //     Test: Integer;
    // begin
    //     RecRef.Open(50001);
    //     RecRef.FindLast;                     
    //     RecID := RecRef.RecordId;
    //     RecRef := RecID.GetRecord;          ////RECORDID. GET RECORD
    //     Message(Format(RecRef.Name));
    //     Test := RecID.TableNo;              ///RECORDID.TABLE NO
    //     Message(Format(Test));
    // end;
    // trigger OnOpenPage()
    // var
    //     MyRecordRef: RecordRef;
    //     Fieldr: FieldRef;
    //     Fieldr1: FieldRef;
    //     Fieldr2: FieldRef;
    //     varkeyref: KeyRef;
    //     Text000: Label 'The %1 table contains %2 records.';
    //     count: Integer;
    //     count1: Integer;
    //     Exist: Boolean;
    //     i, j : Integer;
    // begin
    //     MyRecordRef.Open(Database::Test);              ////RECORDREF.OPEN
    //  Message(Text000, MyRecordRef.Caption, MyRecordRef.Count);  ////RECORDREF.CAPTION,RECORDREF.COUNT
    //     MyRecordRef.Close;                              /////RECORDREF.CLOSE
    //     MyRecordRef.Open(50001);
    //     Fieldr := MyRecordRef.FieldIndex(1);            /////RECORDREF.FIELDINDEX
    //     Message(Format(Fieldr.Name), Format(Fieldr.value));
    //     Exist := MyRecordRef.FieldExist(1);             /////RECORDREF.FIELDEXIST
    //     Message(Format(Exist));
    //     count := MyRecordRef.FieldCount;                ////RECORDREF.FIELDCOUNT
    //     Message(Format(count));
    //     count1 := MyRecordRef.KeyCount;                 ///RECORDREF.KEYCOUNT
    //     Message(Format(count1));
    //     varkeyref := MyRecordRef.KeyIndex(1);           /////RECORDREF.KEYINDEX
    //     Fieldr1 := varkeyref.FieldIndex(1);
    //     Fieldr2 := varkeyref.FieldIndex(2);
    //     Message(Format(Fieldr1.Name));
    //     Message(Format(Fieldr2.Name));
    //     for i := 1 to MyRecordRef.KeyCount do begin
    //         varkeyref := MyRecordRef.KeyIndex(i);
    //         Message('Key Index : %1 Field count : %2', i, Format(varkeyref.FieldCount));
    //         for j := 1 to varkeyref.FieldCount do
    //             Fieldr := varkeyref.FieldIndex(j);
    //         Message(Format(Fieldr.Name));
    //     end;
    // end;
    // trigger OnOpenPage()
    // var
    //     MyRecordRef: RecordRef;
    //     RecID: RecordId;
    //     fieldr: FieldRef;
    //     Ok: Boolean;
    //     Value1: Code[20];
    //     dirty: Boolean;
    //     Text000: Label 'The record id for the record is: %1';
    // begin
    //     MyRecordRef.Open(50000);
    // MyRecordRef.FindLast;
    // fieldr := MyRecordRef.Field(1);
    // fieldr.value := 410;
    // RecID := MyRecordRef.RecordId;          ////RECORDREF.RECORDID
    // Message(Text000, RecID);
    // MyRecordRef.Get(RecID);
    // fieldr := MyRecordRef.Field(2);
    // fieldr.Value := 'MD Abbu';
    // MyRecordRef.Modify();                ////RECORDREF.MODIFY
    // fieldr := MyRecordRef.Field(1);
    // Value1 := '408';
    // Ok := MyRecordRef.Rename(Value1);     ///RECORDREF.RENAME
    //     dirty := MyRecordRef.IsDirty;
    //     Message(Format(dirty));
    // end;
    // trigger OnOpenPage()
    // var
    //     int1: Integer;
    //     int2: Integer;           ////RECORDREF.SystemIdNo;SystemCreatedByNo;SystemCreatedAtNo;
    //     int3: Integer;
    //     int4: Integer;           ///RECORDREF.SystemModifiedAtNo;SystemModifiedByNo;
    //     int5: Integer;
    //     recref: RecordRef;
    //     fieldr: FieldRef;
    // begin
    //     recref.Open(50000);
    //     fieldr := recref.Field(1);
    //     int1 := recref.SystemIdNo;
    //     int2 := recref.SystemCreatedByNo;
    //     int3 := recref.SystemCreatedAtNo;
    //     int4 := recref.SystemModifiedAtNo;
    //     int5 := recref.SystemModifiedByNo;
    //     Message('SystemID : %1 \ SystemCreatedByNo : %2 \ SystemCreatedAtNo : %3 \ SystemModifiedAtNo : %4 \ SystemModifiedByNo : %5', int1, int2, int3, int4, int5);
    // end;
    // trigger OnOpenPage()
    // var                              ////RECORDREF.DUPLICATE
    //     RecordRef1: RecordRef;
    //     RecordRef2: RecordRef;
    //     Text000: Label 'RecordRef1 refers to the %1 table.\\ RecordRef2 refers to the %2 table.';
    // begin
    //     RecordRef1.Open(50000);
    //     RecordRef2 := RecordRef1.Duplicate;
    //     Message(Text000, RecordRef1.Caption, RecordRef2.Caption);
    // end;
    // trigger OnOpenPage()
    // var
    //     Testing: Integer;
    //     Testing1: Integer;
    //     Test: Text;
    //     Test1: Text;
    //     recref: RecordRef;
    //     Testing2: Integer;
    // begin
    //     recref.Open(50000);
    //     Testing := recref.Count;                     //////RECORDREF.COUNT
    //     Testing1 := recref.CountApprox;             //////RECORDREF.COUNT APPROX
    //     Message('Count : %1', Format(Testing));
    //     Message('Count Approx : %1', Format(Testing1));
    //     Test := recref.CurrentCompany;              /////RECORDREF.CURRENT COMPANY
    //     Test1 := recref.CurrentKey;                 /////RECORDREF.CURRENT KEY
    //     Message('Current Company : %1', Format(Test));
    //     Message('CurrentKey : %1', Format(Test1));
    //     Testing2 := recref.CurrentKeyIndex;         ///RECORDREF.CURRENT KEY INDEX
    //     Message(Format(Testing2));
    // end;
    // trigger OnOpenPage()
    // var
    //     recref: RecordRef;
    //     fieldr: FieldRef;
    // begin                        ///RECORDREF.FIND,FINDFIRST-LAST,FINDSET
    //     recref.Open(50000);
    //     fieldr := recref.Field(1);
    //     //fieldr.SetRange('401','404');       
    //     //fieldr.SetFilter('>404 & <408');
    //     // fieldr.Value := 405;
    //     recref.FindLast();
    //     Message(Format(recref.Field(2)));
    //     // if recref.Find('<') then     
    //     //     repeat
    //     //     fieldr:= recref.Field(2);
    //     //         Message(Format(fieldr.Value));
    //     //     until recref.Next(-1) = 0;
    //     Message(Format(recref.GetFilters));
    // end;
    // trigger OnOpenPage()
    // var
    //     recref: RecordRef;
    //     fieldr: FieldRef;
    //     Ok: Boolean;
    // begin
    //     recref.Open(50000);
    //     fieldr := recref.Field(2);
    // recref.Init();
    //fieldr.Value := 'Abbu';
    //recref.Modify()                       ////RECORDREF MODIFY DELETE INSERT
    // fieldr:= recref.Field(2);
    // fieldr.Value := 'Md Abbu';
    // recref.Insert();         
    //recref.DeleteAll();
    //Ok:=recref.IsEmpty;
    //Message(Format(Ok));
    //end;
    // trigger OnAfterGetCurrRecord()
    // var                          ////RECORDREF. ADDLINK | HAS LINK | DELETE LINK | DELETE LINKS
    //     recref: RecordRef;
    //     fieldr: FieldRef;
    //     recid: RecordId;
    //     Url: Text;
    //     Ok: Boolean;
    //     Test: Record "Record Link";
    // begin
    //     recref.Open(50000);
    //     fieldr := recref.Field(1);
    //     fieldr.Value := '401';
    //     recid := recref.RecordId;
    //     Message(Format(recid));
    //     if recref.Get(recid) then begin
    //         Url := 'http://localhost:8080/BC252/';
    //         recref.AddLink(Url, 'local host link');
    //         if Test.FindLast() then
    //             Message('Link Id Created in Record Link Table is : %1 %2', Test."Link ID", Test.Description);
    //         Ok := recref.HasLinks;
    //         Message(Format(Ok));
    //     end;
    //     recref.DeleteLink(60);
    //     recref.DeleteLinks();
    //     if Test.FindLast() then
    //         Message('Link Id Created in Record Link Table is : %1 %2', Test."Link ID", Test.Description);
    // end;
    // trigger OnOpenPage()
    // var
    //     recref: RecordRef;
    //     fieldr: FieldRef;            ////RECORDREF.SET VIEW
    //     isasc: Boolean;
    // begin                            ////RECORDREF.ASCENDING
    //     recref.Open(50000);
    //     fieldr := recref.Field(1);
    //     recref.SetView('Sorting(Name) Order(descending) where ("ID" = FILTER(401..405))');
    // isasc := recref.Ascending(true);
    // Message(Format(isasc));
    //end;
    // trigger OnOpenPage()
    // var
    //     recref: RecordRef;
    //     fieldr: FieldRef;
    //     recid: RecordId;
    // begin
    //     recref.Open(50000);
    //     fieldr := recref.Field(1);
    //     fieldr.Value := '401';
    //     recid := recref.RecordId;
    //     recref.Mark(true);              ////RECORDREF. MARK| MARKEDONLY | CLEAR MARKS
    //     recref.MarkedOnly(true);
    //     recref.ClearMarks();
    //     if recref.FindFirst() then
    //         fieldr := recref.field(2);
    //     Message(Format(fieldr.Value));
    // end;
    // trigger OnOpenPage()
    // var
    //     recref: RecordRef;
    // begin                            //////RECORDREF GETVIEW
    //     recref.Open(50000);
    //     Message(Format(recref.GetView()));
    // end;
    // trigger OnOpenPage()
    // var
    //     Cust: Record Marks;          ////GET TABLE (RECORD --> RECORD REF)
    //     recref: RecordRef;
    //     fieldr: FieldRef;
    //     ok: Boolean;
    // begin
    //     Cust.ID := '408';
    //     cust.AddLoadFields(ID);
    //     recref.GetTable(Cust);
    //     fieldr := recref.field(1);
    //     Message(Format(fieldr.Value));
    //     ok := recref.AreFieldsLoaded(1);
    //     Message(Format(ok));
    // end;
    // trigger OnOpenPage() 
    // var                          /////SET TABLE (RECORD REF --> RECORD)
    //     test: record Marks;  
    //     recref: RecordRef;
    //     fieldr: FieldRef;
    // begin                    
    // recref.Open(50001);
    // fieldr:=recref.Field(1);
    // fieldr.Value := '408';    
    // recref.SetTable(test);
    // Message(Format(Test.ID));
    // end;
    // trigger OnOpenPage()
    // var                          ////DAY, DAYOFWEEK, MONTH, TOTEXT, WEEKNO,
    //     dayofthweek: Integer;
    //     dat: Date;
    //     as:BigText;
    // begin                            /////DATE DATA TYPE
    //     dat := Today;
    //     dayofthweek := dat.Year;
    //     Message(Format(dayofthweek));
    // end;
    // trigger OnOpenPage()
    // var                                     ///HOUR | MILLISECOND | SECOND | MINUTE
    //     Hour: Integer;
    //     Tim: Time;
    //     Test: Integer;
    //     Test1: Integer;
    //     Test2: Integer;
    // begin                                  ////TIME DATA TYPE
    //     tim := Time;
    //     Hour := tim.Hour;
    //     Message('Current Hour : %1', Format(Hour));
    //     Test2 := tim.Millisecond;
    //     Message('Current Millisecond : %1', Format(Test2));
    //     Test1 := tim.Minute;
    //     Message('current minute : %1', Format(Test1));
    //     Test := tim.Second;
    //     Message('current second : %1', Format(Test));
    //     //Test:= tim.ToText();
    // end;
    // trigger OnOpenPage()
    // var                              ////DURATION DATA TYPE
    //     DateTime1: DateTime;
    //     DateTime2: DateTime;
    //     Duration: Duration;
    // begin
    //     DateTime1 := CreateDateTime(20090101D, 080000T); // January 1, 2009 at 08:00:00 AM  
    //     DateTime2 := CreateDateTime(20090505D, 133001T); // May 5, 2009 at 1:30:01 PM  
    //     Duration := DateTime2 - DateTime1;   
    //     Message(Format(Duration));                     ///124 days 5 hours 30 minutes 1 second
    // end;
    // trigger OnOpenPage()
    // var                                          ////ENUM DATA TYPE
    //     test1: Integer;
    //     ex: Enum GenderTest;
    //     Test: List of [Text];
    //     Test3: List of [Integer];
    //     Test4: Integer;
    //     Test2: Text;
    //     Test5: Integer;
    // begin
    //     ex := ex::Male;
    //     test5 := ex.AsInteger();                 ////AS INTEGER | ORDINALS | NAMES
    //     Message(Format(Test5));
    //     Test := ex.Names();
    //     foreach Test2 in Test do
    //         Message(Format(Test2));
    //     Test3 := ex.Ordinals;
    //     foreach Test4 in Test3 do
    //         Message(Format(Test4));
    // end;
    // trigger OnAfterGetCurrRecord()
    // begin
    //     if rec.Get('401') then
    //         page.Run(50003);         /////PAGE.RUN
    // end;
    // trigger OnOpenPage()
    // begin
    //     rec.Get('401');              ////RECORD.SETRECFILTER
    //     rec.SetRecFilter();
    // end;
    // trigger OnOpenPage()
    // var                                ////BIG TEXT
    //     MybT: BigText;
    //     mytext: Text;
    //     length: Integer;
    // begin                             /////ADD TEXT | GETSUBTEXT | TEXTPOS | LENGTH
    //     MybT.AddText('abyfgs87');
    //     MybT.AddText('dcnuiwbc', 7);
    //     MybT.AddText('xsuhxybc', 0);
    //     MybT.AddText('xsuhxybc', 15);
    //     length := MybT.GetSubText(MybT, 3, 5);
    //     length := MybT.Length;
    //     length := MybT.TextPos('a');
    //     Message(Format(length));
    //     Message(Format(MybT));
    // end;
    // trigger OnOpenPage()
    // var
    //     mycd1: Codeunit Mysimpletest;            ///CODEUNIT
    // begin
    //     mycd1.Run();
    //Codeunit.Run(Codeunit::Mysimpletest);
    //myworkdate();
    //end;

    // procedure myworkdate(): DateTime
    // var
    //     Dati: DateTime;
    // begin
    //     Dati := CurrentDateTime;
    //     Message(Format(Dati));
    // end;
    // trigger OnAfterGetCurrRecord()
    // var
    //     mycd3: Codeunit "Mail Management";
    // begin
    //     if mycd3.CheckValidEmailAddress(rec.Email) then
    //         Message('Email address is correct')
    //     else
    //         Message('Email Address is not correct');
    // end;
    //     if isvalidemail() then
    //         Message('Email address is correct')
    //     else
    //         Message('Email address is wrong');
    // end;
}