VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} UserForm1 
   Caption         =   "UserForm1"
   ClientHeight    =   3345
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   7140
   OleObjectBlob   =   "UserForm1.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "UserForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private oVars As Variables


Private Sub CommandButton1_Click()
'okee  okee
'Define the variable oVars
Set oVars = ActiveDocument.Variables

Dim strPath As String
strPath = Mid(ActiveDocument.Name, 1, Len(ActiveDocument.Name) - 4)
'MsgBox (oVars("mem1").Value)

'Hide the userform
Me.Hide

oVars("artikelnaam").Value = Me.TextBox1.Value
'oVars("letref").Value = Me.TextBox2.Value + "-" + Me.TextBox3.Value + Me.TextBox4.Value
oVars("letref").Value = Me.TextBox2.Value + "-" + Left(strPath, 9) + Me.TextBox4.Value
oVars("letref").Value = UCase(oVars("letref").Value)
oVars("filenaamzonderextentie").Value = strPath




oVars("var4").Value = Me.TextBox4.Value


ActiveDocument.Fields.Update
'Clear the variable
Set oVars = Nothing
'Unload the form
Unload Me
End Sub

 



Private Sub CommandButton2_Click()
'Unload the form
Unload Me
End Sub



Private Sub CommandButton3_Click()
'MsgBox ("debug")
'("C:\Users\vth\Desktop\msoft.xlsx")
   'https://social.msdn.microsoft.com/Forums/en-US/62fceda5-b21a-40b6-857c-ad28f12c1b23/use-excel-vba-to-open-a-text-file-and-search-it-for-a-specific-string?forum=isvvba
   Dim strPath As String
strPath = Left(ActiveDocument.Name, 9)
'MsgBox (strPath)
     Const strFileName = "C:\Users\vth\Desktop\template2018\logfiles\msoft.txt" ' = via msoft naar  excel en dan opslaan als txt
     '  strSearch = "strPath"
    Dim strLine As String
    Dim f As Integer
    Dim lngLine As Long
    Dim blnFound As Boolean
    f = FreeFile
    Open strFileName For Input As #f
    Do While Not EOF(f)
        lngLine = lngLine + 1
        Line Input #f, strLine
        If InStr(1, strLine, strPath, vbTextCompare) > 0 Then
          '  MsgBox "Search string found in line " & lngLine, vbInformation
                       ' MsgBox (strLine)
            
            'we moeten split doen op tab
            Dim WrdArray() As String
 'splitsen op tab
WrdArray() = Split(strLine, vbTab)
            
             Me.TextBox1.Value = WrdArray(0)
             Me.TextBox2.Value = WrdArray(1)
             Me.TextBox3.Value = WrdArray(2)
            
            'Define the variable oVars
Set oVars = ActiveDocument.Variables
'Hide the userform
Me.Hide
oVars("filenaamzonderextentie").Value = strLine
oVars("artikelnaam").Value = Me.TextBox1.Value
oVars("letref").Value = Me.TextBox2.Value + "-" + Me.TextBox3.Value
'oVars("filenaamzonderextentie").Value = strPath
ActiveDocument.Fields.Update
                      
            blnFound = True
            Exit Do
        End If
    Loop
    Close #f
    If Not blnFound Then
        MsgBox "Search string not found", vbInformation
    End If
    
    
      'verpakkingslabel genereren in nummers.txt
    
    'printen naar file ?C:\Users\VTH\Desktop\nummers.txt
            
            map = "C:\Users\VTH\Desktop\"
            bestand = "nummers.txt"
           
            Dim strFile_Path As String
            strFile_Path = map & bestand
            Open strFile_Path For Output As #1
'Print #1, "proj" & ActiveSheet.Range("a1").Value
            
                
                 
                    Print #1, Me.TextBox1.Value & "!" & Me.TextBox2.Value + "-" + Me.TextBox3.Value
                
 
             
'file sluiten en vrijgeven
            Close #1
            
            'einde     'verpakkingslabel genereren in nummers.txt
    
  
    
    
  'Unload the form
Unload Me
End Sub

Private Sub UserForm_Initialize()
Me.Caption = "My Produktievoorschrift wizard"
Me.Label1.Caption = "artikelnaam"
Me.Label2.Caption = "prefix"
Me.Label3.Caption = "LETnummer"
Me.Label4.Caption = "suffix"
Me.CommandButton1.Caption = "OK"
Me.CommandButton2.Caption = "Cancel"
Me.CommandButton3.Caption = "via msoft.txt"
End Sub

