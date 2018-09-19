var callStatus = $("#call-status");
var answerButton = $(".answer-button");
var callStudentButton = $(".call-support-button");
var hangUpButton = $(".hangup-button");
var callCustomerButtons = $(".call-customer-button");

/* Helper function to update the call status bar */
function updateCallStatus(status) {
  $("#call-status").text(status);
}

/* Get a Twilio Client token with an AJAX request */
 $(document).ready(function() {
//$(document).on('turbolinks:load', function() {

  $.post("/token/generate", {page: window.location.pathname}, function(data) {
    // Set up the Twilio Client Device with the token
    console.log("He llegado");
    console.log(Twilio.Device);
    Twilio.Device.setup(data.token);
  });
});

function call() {
  Twilio.Device.connect({id: 1})
}

/* Callback to let us know Twilio Client is ready */
Twilio.Device.ready(function (device) {
  updateCallStatus("Ready");
});

/* Report any errors to the call status display */
Twilio.Device.error(function (error) {
  updateCallStatus("ERROR: " + error.message);
});

/* Callback for when Twilio Client initiates a new connection */
Twilio.Device.connect(function (connection) {
  // Enable the hang up button and disable the call buttons
  $(".hangup-button").prop("disabled", false);
  callCustomerButtons.prop("disabled", true);
  callStudentButton.prop("disabled", true);
  answerButton.prop("disabled", true);

  // If phoneNumber is part of the connection, this is a call from a
  // support agent to a customer's phone
  if ("phoneNumber" in connection.message) {
    updateCallStatus("In call with " + connection.message.phoneNumber);
  } else {
    // This is a call from a website user to a support agent
    updateCallStatus("In call with student");
  }
});

/* Callback for when a call ends */
Twilio.Device.disconnect(function(connection) {
  // Disable the hangup button and enable the call buttons
  $(".hangup-button").prop("disabled", true);
  callCustomerButtons.prop("disabled", false);
  callStudentButton.prop("disabled", false);

  updateCallStatus("Ready");
});

/* Callback for when Twilio Client receives a new incoming call */
Twilio.Device.incoming(function(connection) {
  updateCallStatus("Incoming support call");

  // Set a callback to be executed when the connection is accepted
  connection.accept(function() {
    updateCallStatus("In call with customer");
  });

  // Set a callback on the answer button and enable it
  answerButton.click(function() {
    connection.accept();
  });
  answerButton.prop("disabled", false);
});

/* Call the support_agent from the home page */
function callStudent(phoneNumber) {
  console.log(phoneNumber);
  updateCallStatus("Calling " + phoneNumber + "...");
  var params = {"phoneNumber": phoneNumber};
  Twilio.Device.connect(params);
}

/* End a call */
function hangUp() {
  Twilio.Device.disconnectAll();
}
