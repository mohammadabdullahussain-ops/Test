/// <summary>
/// Codeunit Mysimpletest (ID 50000).
/// </summary>
codeunit 50000 Mysimpletest
{
    //TableNo = Test;
    SingleInstance = false;

    trigger OnRun()
    begin
        formattedDate();
    end;

    internal procedure Todaydate(): Date
    begin
        exit(Today());
    end;

    internal procedure formattedDate(): Text
    var
        Todate: Date;
    begin
        Todate := Today;
        Message('Formatted Date  : %1', Format(Todate, 20, 4));
    end;

    /// <summary>
    /// passbyvalue.
    /// </summary>
    /// <param name="Number">Integer.</param>
    /// <returns>Return value of type Integer.</returns>
    procedure passbyvalue(Number: Integer): Integer
    begin
        Number := Number + 10;
        exit(Number);
    end;

    /// <summary>
    /// passbyref.
    /// </summary>
    /// <param name="Number">VAR Integer.</param>
    /// <returns>Return value of type Integer.</returns>
    procedure passbyref(var Number: Integer): Integer
    begin
        Number := Number + 10;
        exit(Number);
    end;
}

