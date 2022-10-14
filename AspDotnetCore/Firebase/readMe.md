### auth
```cs
// See https://aka.ms/new-console-template for more information

using FirebaseAdmin;
using FirebaseAdmin.Auth;
using Google.Apis.Auth.OAuth2;

FirebaseApp.Create(new AppOptions()
{
    Credential = GoogleCredential.FromFile(@"firebase-config.json"),
});

UserRecordArgs arg = new UserRecordArgs()
{
    Email = "user@example.com",
    EmailVerified = false,
    PhoneNumber = "+11234567890",
    Password = "secretPassword",
    DisplayName = "John Doe",
    PhotoUrl = "http://www.example.com/12345678/photo.png",
    Disabled = false,
};
UserRecord userRecord = await FirebaseAuth.DefaultInstance.CreateUserAsync(arg);
// See the UserRecord reference doc for the contents of userRecord.
Console.WriteLine($"Successfully created new user: {userRecord.Uid}");
```
