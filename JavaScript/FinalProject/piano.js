(function() {
  //keyboard pitches
  var keys =['A2', 'Bb2', 'B2', 'C3', 'Db3', 'D3', 'Eb3', 'E3', 'F3', 'Gb3', 'G3', 'Ab3','A3', 'Bb3', 
  'B3', 'C4', 'Db4', 'D4', 'Eb4', 'E4', 'F4', 'Gb4', 'G4', 'Ab4','A4', 'Bb4', 'B4', 'C5'];
  //key codes with the key names
  var keyboardkeys = [90, 83, 88, 67, 70, 86, 71, 66, 78, 74, 77, 75, 81, 50, 87, 69, 52, 
    82, 53, 84, 89, 55, 85, 56, 73, 57, 79, 80];
  
  var tonic = 'A2';
  //current keys pressed and depressed,
  var pressed = {};
  var depressed = {};
  //format note into string
  function soundId(id) {
    return 'sound-' + id;
  };

  //get the note
  function sound(id) {
    var it = document.getElementById(soundId(id));
    return it;
  };

  //return key that is played based on the keyboard key array
  function keyup(ckey) {
    var location = keyboardkeys.indexOf(ckey);
    return keys[(keys.indexOf(ckey) + location)];
  };

  //need two functions for play and stop
  function keydown(code) {
    return keyup(code);
  };

  //plays the audio of the note
  function press(key) {
    var audio = sound(key);
    //if pressed doesn't play mutliple
    if (depressed[key]) {
      return;
    }//remove keys from pressed, stops previous same note from bieng played
    clearInterval(pressed[key]);
    //audio.pause();
    audio.volume = 1.0;
    //how long its been playing
    if (audio.readyState >= 2) {
      audio.currentTime = 0;
      audio.play();
      depressed[key] = true;
    }
  };

  //stop key from playing, remove from array
  function stop(key) {
    var audio = sound(key);
    return function() {
      clearInterval(pressed[key]);
      audio.pause();
    };
  };

  //monitors what key is pressed(key down) then plays it
  jQuery(document).keydown(function(event) {
    press(keydown(event.which));
  });
  
  //stops note when keybord goes up
  jQuery(document).keyup(function(event) {
      Object.keys(depressed).forEach(function(key) {
        //if the key is not in the depressed array, stop it
        if (!depressed[key]) {
            stop(key)();
        }
      });
    //once key goes up, set it to false in array, and stop it
    if (keyup(event.which)) {
      depressed[keyup(event.which)] = false;
      stop(keyup(event.which))();
    }
  });
})();