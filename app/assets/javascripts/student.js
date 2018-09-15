 // LOCAL Student
 alert("nooo")
 var studentAccessToken   = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImN0eSI6InR3aWxpby1mcGE7dj0xIn0.eyJqdGkiOiJTSzViOWJmZmQ1MzEzZjM3YWY3ZTFlNTg2Yjc5NGQ4Y2YyLTE1MzcwMjI1NTkiLCJpc3MiOiJTSzViOWJmZmQ1MzEzZjM3YWY3ZTFlNTg2Yjc5NGQ4Y2YyIiwic3ViIjoiQUMxN2Y2MzM5MjRmODE5ODc5YzVmMWY4Mzg3N2YzZWY4NSIsImV4cCI6MTUzNzAyNjE1OSwiZ3JhbnRzIjp7ImlkZW50aXR5Ijoic3R1ZGVudCIsInZpZGVvIjp7InJvb20iOiJyb29tLWRldiJ9fX0.qSZ5Eojgm4x3YJkm_Cdlo1nHARK-zD_jUQfdj5paMLQ';
 var studentAccessManager = new Twilio.AccessManager(studentAccessToken);
 var client = new Twilio.Conversations.Client(studentAccessManager);

 client.listen().then(function() {
  client.on('invite', function(invite) {
    invite.accept().then(onInviteAccepted);
  });
});
