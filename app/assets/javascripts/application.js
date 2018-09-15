// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// $(document).on('turbolinks:load', function () {
//   var activeRoom;
//   var previewTracks;
//   var identity;
//   var roomName;

// // Attach the Tracks to the DOM.
// function attachTracks(tracks, container) {
//   tracks.forEach(function(track) {
//     container.appendChild(track.attach());
//   });
// }

// // Attach the Participant's Tracks to the DOM.
// function attachParticipantTracks(participant, container) {
//   var tracks = Array.from(participant.tracks.values());
//   attachTracks(tracks, container);
// }

// // Detach the Tracks from the DOM.
// function detachTracks(tracks) {
//   tracks.forEach(function(track) {
//     track.detach().forEach(function(detachedElement) {
//       detachedElement.remove();
//     });
//   });
// }

// // Detach the Participant's Tracks from the DOM.
// function detachParticipantTracks(participant) {
//   var tracks = Array.from(participant.tracks.values());
//   detachTracks(tracks);
// }

// // When we are about to transition away from this page, disconnect
// // from the room, if joined.
// window.addEventListener('beforeunload', leaveRoomIfJoined);

// // Obtain a token from the server in order to connect to the Room.
// //$.getJSON('https://rust-jaguar-8125.twil.io/video-token?identity=peo', function(data) {
//   // identity = data.identity;
//   identity = "peo";
//   document.getElementById('room-controls').style.display = 'block';

//   // Bind button to join Room.
//   document.getElementById('button-join').onclick = function() {
//     roomName = document.getElementById('room-name').value;
//     if (!roomName) {
//       alert('Please enter a room name.');
//       return;
//     }

//     log("Joining room '" + roomName + "'...");
//     var connectOptions = {
//       name: roomName,
//       logLevel: 'debug'
//     };

//     if (previewTracks) {
//       connectOptions.tracks = previewTracks;
//     }

//     // Join the Room with the token from the server and the
//     // LocalParticipant's Tracks.
//     Video.connect("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImN0eSI6InR3aWxpby1mcGE7dj0xIn0.eyJqdGkiOiJTSzU5OWRlNjAzMzhlMWE0NmRlZTVhMjAzMjM4NzhhNjhlLTE1MzcwMDU3MTEiLCJncmFudHMiOnsiaWRlbnRpdHkiOiJwZW8iLCJ2aWRlbyI6eyJyb29tIjoiQ2hhbmdlVGhpc0luRnVuY3Rpb25zVHdpbGlvd2ViIn19LCJpYXQiOjE1MzcwMDU3MTEsImV4cCI6MTUzNzAwOTMxMSwiaXNzIjoiU0s1OTlkZTYwMzM4ZTFhNDZkZWU1YTIwMzIzODc4YTY4ZSIsInN1YiI6IkFDMTdmNjMzOTI0ZjgxOTg3OWM1ZjFmODM4NzdmM2VmODUifQ.ON2PreI8Nq4DjzxmWdmJRs3VtgTCof-OMITbwETwTjQ", connectOptions).then(roomJoined, function(error) {
//       log('Could not connect to Twilio: ' + error.message);
//     });
//   };

//   // Bind button to leave Room.
//   document.getElementById('button-leave').onclick = function() {
//     log('Leaving room...');
//     activeRoom.disconnect();
//   };
// //});

// // Successfully connected!
// function roomJoined(room) {
//   window.room = activeRoom = room;

//   log("Joined as '" + identity + "'");
//   document.getElementById('button-join').style.display = 'none';
//   document.getElementById('button-leave').style.display = 'inline';

//   // Attach LocalParticipant's Tracks, if not already attached.
//   var previewContainer = document.getElementById('local-media');
//   if (!previewContainer.querySelector('video')) {
//     attachParticipantTracks(room.localParticipant, previewContainer);
//   }

//   // Attach the Tracks of the Room's Participants.
//   room.participants.forEach(function(participant) {
//     log("Already in Room: '" + participant.identity + "'");
//     var previewContainer = document.getElementById('remote-media');
//     attachParticipantTracks(participant, previewContainer);
//   });

//   // When a Participant joins the Room, log the event.
//   room.on('participantConnected', function(participant) {
//     log("Joining: '" + participant.identity + "'");
//   });

//   // When a Participant adds a Track, attach it to the DOM.
//   room.on('trackAdded', function(track, participant) {
//     log(participant.identity + " added track: " + track.kind);
//     var previewContainer = document.getElementById('remote-media');
//     attachTracks([track], previewContainer);
//   });

//   // When a Participant removes a Track, detach it from the DOM.
//   room.on('trackRemoved', function(track, participant) {
//     log(participant.identity + " removed track: " + track.kind);
//     detachTracks([track]);
//   });

//   // When a Participant leaves the Room, detach its Tracks.
//   room.on('participantDisconnected', function(participant) {
//     log("Participant '" + participant.identity + "' left the room");
//     detachParticipantTracks(participant);
//   });

//   // Once the LocalParticipant leaves the room, detach the Tracks
//   // of all Participants, including that of the LocalParticipant.
//   room.on('disconnected', function() {
//     log('Left');
//     if (previewTracks) {
//       previewTracks.forEach(function(track) {
//         track.stop();
//       });
//       previewTracks = null;
//     }
//     detachParticipantTracks(room.localParticipant);
//     room.participants.forEach(detachParticipantTracks);
//     activeRoom = null;
//     document.getElementById('button-join').style.display = 'inline';
//     document.getElementById('button-leave').style.display = 'none';
//   });
// }

// // Preview LocalParticipant's Tracks.
// document.getElementById('button-preview').onclick = function() {
//   var localTracksPromise = previewTracks
//   ? Promise.resolve(previewTracks)
//   : Video.createLocalTracks();

//   localTracksPromise.then(function(tracks) {
//     window.previewTracks = previewTracks = tracks;
//     var previewContainer = document.getElementById('local-media');
//     if (!previewContainer.querySelector('video')) {
//       attachTracks(tracks, previewContainer);
//     }
//   }, function(error) {
//     console.error('Unable to access local media', error);
//     log('Unable to access Camera and Microphone');
//   });
// };

// // Activity log.
// function log(message) {
//   var logDiv = document.getElementById('log');
//   logDiv.innerHTML += '<p>&gt;&nbsp;' + message + '</p>';
//   logDiv.scrollTop = logDiv.scrollHeight;
// }

// // Leave Room.
// function leaveRoomIfJoined() {
//   if (activeRoom) {
//     activeRoom.disconnect();
//   }
// }
// });
