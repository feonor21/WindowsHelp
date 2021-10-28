Start-Transcript "pathfile\of\logfile"

Write-Output "script launch"
[Net.ServicePointManager]::SecurityProtocol = `
    [Net.SecurityProtocolType]::Tls12,
    [Net.SecurityProtocolType]::Tls11 ;
[Net.ServicePointManager]::SecurityProtocol

Write-Output "configuration smtpserver"
#region smtpserver
$SMTPServer = "smtp.office365.com" 
$SMTPPort = 587 

$username = 'account@email.com'
$password = 'password'

$secpasswd = ConvertTo-SecureString $password -AsPlainText -Force
$SMTPCredentials = New-Object System.Management.Automation.PSCredential ($username, $secpasswd)
#endregion Test

Write-Output "configuration constant mail"
#region mail generation
[string[]]$EmailTo = "dest1 <account@email.com>","dest2 <account2@email.com>"
$EmailFrom = "from1 <account@email.com>"

[string[]]$fileattachment = @()
$fileattachment += "pathfile\of\attachement1"
$fileattachment += "pathfile\of\attachement2"
	
$Subject = "subject of mail"
$Body = "body of mail"
	
#endregion Test

Write-Output "sending mail"
#region mail send
#try catch du send-mailmessage pour ecrire l'erreur dans les logs si on est pas en debug
try
{
  Send-MailMessage -From $EmailFrom -To $EmailTo -Subject $Subject -Body $Body -Attachments $fileattachment -Priority High -DeliveryNotificationOption Never -SmtpServer $SMTPServer -Credential $SMTPCredentials -UseSsl -Port 587
  Write-Output "Message send succefully ."
}
catch
{
  Write-output "Message send failed. with error :" $_.Exception.Message
}
#endregion Test

exit
