/// <summary>
/// Codeunit MySelectionHandler (ID 50100).
/// </summary>
codeunit 50100 MySelectstrmenu
{
    SingleInstance = true;
    Subtype = Normal;

    var
        SelectedOption: Integer;

    /// <summary>
    /// ShowStrMenu.
    /// </summary>
    procedure ShowStrMenu()
    var
        Options: Text[250];
    begin
        Options := '1st,2nd,3rd,4th,5th';
        SelectedOption := StrMenu(Options, 1, 'Select an option');
    end;

    /// <summary>
    /// GetSelectedOption.
    /// </summary>
    /// <returns>Return value of type Integer.</returns>
    procedure GetSelectedOption(): Integer
    begin
        exit(SelectedOption);
    end;
}
