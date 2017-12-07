const Hello = {
  initialize() {
    var abcNode = document.getElementById('abc');
    var boomNode = document.getElementById('boom');

    abcNode.addEventListener('click', (event) => {
      event.preventDefault();
      Hello.example();
    });
    boomNode.addEventListener('click', (event) => {
      event.preventDefault();
      Hello.boom();
    });
  },

  example: function () {
    var node = document.getElementById("hello");
    var value = node.innerHTML;
    var abc = Hello.abc();
    console.log(abc);
    node.innerHTML = value + " " + abc;
  },

  abc: function() {
    return this.a();
  },

  a: function() {
    return 'a' + this.b();
  },

  b: function() {
    return 'b' + this.c();
  },

  c: function() {
    return 'c';
  },

  boom: function() {
    throw "boom";
  }
};

document.addEventListener('DOMContentLoaded', () => {
  Hello.initialize();
});
