VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "materializeEvents"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Option Compare Text

Public mz As materialize
Attribute mz.VB_VarHelpID = -1
Public controlType As String

Public WithEvents txt As MSForms.TextBox
Attribute txt.VB_VarHelpID = -1
Public WithEvents lbl As MSForms.Label
Attribute lbl.VB_VarHelpID = -1
Public WithEvents btn As MSForms.CommandButton
Attribute btn.VB_VarHelpID = -1
Public WithEvents cmb As MSForms.ComboBox
Attribute cmb.VB_VarHelpID = -1
Public WithEvents frm As MSForms.Frame
Attribute frm.VB_VarHelpID = -1


Private Sub btn_KeyUp(ByVal KeyCode As MSForms.ReturnInteger, ByVal Shift As Integer)
    If KeyCode = vbKeyTab Then
        mz.setFocus ""
    End If
End Sub

Private Sub btn_MouseMove(ByVal Button As Integer, ByVal Shift As Integer, ByVal x As Single, ByVal Y As Single)
    mz.onButton = True
    mz.BtnHover btn.name
End Sub


Private Sub cmb_KeyUp(ByVal KeyCode As MSForms.ReturnInteger, ByVal Shift As Integer)
    cmb.DropDown
End Sub


Private Sub frm_MouseDown(ByVal Button As Integer, ByVal Shift As Integer, ByVal x As Single, ByVal Y As Single)
    On Error GoTo catch
    Select Case controlType
        Case "dropdown":
            cmb.DropDown
        Case "textbox":
            txt.setFocus
            mz.setFocus txt.name
    End Select
catch:
End Sub

Private Sub lbl_MouseDown(ByVal Button As Integer, ByVal Shift As Integer, ByVal x As Single, ByVal Y As Single)
    On Error GoTo catch
    Select Case controlType
        Case "dropdown":
            cmb.DropDown
        Case "textbox":
            txt.setFocus
            mz.setFocus txt.name
    End Select
catch:
End Sub

Private Sub txt_KeyDown(ByVal KeyCode As MSForms.ReturnInteger, ByVal Shift As Integer)
    
    If KeyCode <> vbKeyTab And KeyCode <> vbKeyReturn Then
        txt.setFocus
        mz.setFocus txt.name
    End If
    
End Sub

Private Sub txt_KeyUp(ByVal KeyCode As MSForms.ReturnInteger, ByVal Shift As Integer)
    If KeyCode = vbKeyTab Or KeyCode = vbKeyReturn Then
        If mz.liveValidation = True Then mz.Validate
        txt.setFocus
        mz.setFocus txt.name
    End If
End Sub

Private Sub txt_MouseDown(ByVal Button As Integer, ByVal Shift As Integer, ByVal x As Single, ByVal Y As Single)
    mz.setFocus txt.name
End Sub


Private Sub cmb_Change()
    Dim ctrl As MSForms.Control
    
    If cmb.value <> "" Then
        For Each ctrl In cmb.Parent.Controls
            If ctrl.tabIndex = cmb.tabIndex + 1 Then
                ctrl.setFocus
                mz.setFocus ctrl.name
                Exit For
            End If
        Next ctrl
    End If
    
End Sub
