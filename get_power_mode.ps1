using namespace System.Windows.Forms
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
[Application]::EnableVisualStyles()

# フォーム
$frame = New-Object Form -Property @{
    Text            = '電源プランの確認'
    Size            = New-Object Drawing.Size(300, 200)
    MaximizeBox     = $false
    FormBorderStyle = 'FixedDialog'
    Font            = New-Object Drawing.Font('Meiryo UI', 30)
}

# ラベル
$Label1 = New-Object Label -Property @{
    Text        = ((powercfg.exe /GETACTIVESCHEME) -split " \(" -split "\)")[1]
    #Text        = 'hoge'
    #Location    = New-Object Drawing.Point(20, 20)
    AutoSize    = $True
}

$frame.Controls.AddRange(@($Label1))

#フォームの表示
$frame.ShowDialog()