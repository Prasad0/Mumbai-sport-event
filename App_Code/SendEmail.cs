using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Net.Mail;
using System.Net;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Text;
using System.Security.Cryptography;
public class SendEmail1
{
    MailMessage mail;
    NetworkCredential mailAuthentication;
    static string FromID = "naajrp979697@gmail.com";                // ENTER FROM EMAIL ID
    static string pwd = "Plzdontopen12";                             // PASSWORD

    public void sendEMail(string ToEmail, string Subject, string msg)
    {
        mail = new MailMessage(FromID, ToEmail, Subject,  msg);
        mailAuthentication = new NetworkCredential(FromID,  pwd);
        SmtpClient mailClient = new SmtpClient("smtp.gmail.com", 587);
        mailClient.EnableSsl = true;
        mailClient.Credentials = mailAuthentication;
        mail.IsBodyHtml = true;
        mailClient.Send(mail);
    }
    
}