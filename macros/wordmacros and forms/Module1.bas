 
Sub ProduktievoorschriftWizard()
UserForm1.Show
Unload UserForm1

End Sub



Sub UpdateAllFields()
Dim oStory As Range

For Each oStory In ActiveDocument.StoryRanges
oStory.Fields.Update
If oStory.StoryType <> wdMainTextStory Then
While Not (oStory.NextStoryRange Is Nothing)
Set oStory = oStory.NextStoryRange
oStory.Fields.Update
Wend
End If
Next oStory

Set oStory = Nothing

  Dim toc As TableOfContents
    For Each toc In ActiveDocument.TablesOfContents
        toc.Update
    Next toc

Set TableOfContents = Nothing

End Sub


Public Sub nummer_ingeven()


Dim str As String
Dim map As String

str = InputBox("Geef het nummer in !")

If Len(str) = 0 Or Len(str) < 13 Then Exit Sub

If Len(str) = 13 Then

 map = "L:\letdata\data\" & Mid(str, 4, 2) & "\" & Mid(str, 6, 4) & "\" & Left(str, 1) & "\" & Left(str, 3) & "\"
 If Dir(map & str & "\", vbDirectory) <> "" Then map = map & str & "\"
 
ElseIf Left(str, 2) = "20" And Len(str) = 15 Then
 
 map = "L:\letdata\Customerorders\" & Mid(str, 3, 2) & "\" & Mid(str, 1, 8) & "\" & Mid(str, Len(str) - 5, 2) & "\"
 If Dir(map & str & "\", vbDirectory) <> "" Then map = map & str & "\"
 
 
ElseIf Left(str, 1) = "0" Or Left(str, 1) = "1" Or Left(str, 1) = "2" Or Left(str, 1) = "3" Then

 map = "L:\letdata\data\" & Mid(str, 1, 2) & "\" & Mid(str, 3, 7) & "\" & Mid(str, Len(str) - 5, 2) & "\"
 If Dir(map & str & "\", vbDirectory) <> "" Then map = map & str & "\"

Else

 For i = 1 To Len(str)
 
  Select Case Mid(str, i, 1)
  Case "1", "2", "3", "4", "5", "6", "7", "8", "9"
  
   map = "L:\letdata\Projects\" & Mid(str, i, 2) & "\" & Mid(str, 1, Len(str) - 7) & "\" & Mid(str, Len(str) - 5, 2) & "\"
   If Dir(map & str & "\", vbDirectory) <> "" Then map = map & str & "\"
   Exit For
  Case Else
  End Select
 
 Next i


End If
 
 

If Dir(map, vbDirectory) = "" Then Exit Sub

Options.DefaultFilePath(Path:=wdPicturesPath) = map
Options.DefaultFilePath(Path:=wdDocumentsPath) = map

End Sub






Sub mstrefurbisch()
'
' macro  mst engeland
'
'
sPrompt = "Please serienr , vb : EP180060.001"
sTitle = "Name Entry"
sDefault = "EP"
sUserName = InputBox(sPrompt, sTitle, sDefault)

sVerschil = InputBox("verschil in mm", "geen mm typen enkel getal")

sFilenaamzonderextentie = Left(ActiveDocument.Name, Len(ActiveDocument.Name) - 4)

 ActiveDocument.Variables("verschil").Value = sVerschil


 ActiveDocument.Variables("letref").Value = sUserName
 ActiveDocument.Variables("fileNoext").Value = sFilenaamzonderextentie
  ActiveDocument.Variables("calibdatum").Value = Date
    ActiveDocument.Variables("geldigtot").Value = DateAdd("yyyy", 1, Date)
 
ActiveDocument.Fields.Update



''update alle velden ook in koptext en voettext
Dim oStory As Range

For Each oStory In ActiveDocument.StoryRanges
oStory.Fields.Update
If oStory.StoryType <> wdMainTextStory Then
While Not (oStory.NextStoryRange Is Nothing)
Set oStory = oStory.NextStoryRange
oStory.Fields.Update
Wend
End If
Next oStory

Set oStory = Nothing

  Dim toc As TableOfContents
    For Each toc In ActiveDocument.TablesOfContents
        toc.Update
    Next toc

Set TableOfContents = Nothing

End Sub






Sub prentjesresizen()
'zet alle prentjes op 2inch van de boord
'prentjes moeten wel property hebben ' achter text'
'want anders is het een inlineshape ipv een shape

Dim i As Long
With ActiveDocument
    For i = 1 To .Shapes.Count
      
        
        
        
        
        With ActiveDocument.Shapes(i)
.RelativeHorizontalPosition = wdRelativeHorizontalPositionPage
.Left = InchesToPoints(1)
End With
        
        
        
    Next i
End With







End Sub

