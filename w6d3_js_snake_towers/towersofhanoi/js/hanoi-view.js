class HanoiView {
  constructor(hanoigame,dom){
    this.$dom = dom;
    this.game = hanoigame;
    this.columns = [];
  }
  setupTowers() {
    this.$dom.append("<ul><li id=1></li><li id=2></li><li id=3></li></ul><ul></ul><ul></ul>");
    $("ul").css("float", "left");

    $("ul").each(function(idx, el) {
    $(el).attr("data-pos", idx);
    $(el).css({
      "width":"100px",
      "border":"1px solid black",
      "height":"60px"
    });
  });

  $("#1").css({
    "width":"20px",
    "background":"blue",
    "margin" : "5px auto ",
    "border-radius" : "10px",
    "height" : "10px"
  });

  $("#2").css({
    "width":"40px",
    "background":"orange",
    "margin" : "5px auto ",
    "border-radius" : "10px",
    "height" : "10px"
  });

  $("#3").css({
    "width":"60px",
    "background":"red",
    "margin" : "5px auto ",
    "border-radius" : "10px",
    "height" : "10px"
  });

  $("li").css({
  });

  }

  render() {
    let that = this;
    $('ul').click( function(event) {
      let currentTarget = event.currentTarget;
      let $currentTarget = $(currentTarget);
      that.columns.push($currentTarget.attr('data-pos'));

      if (that.columns.length === 2) {

        if (that.game.move(that.columns[0],that.columns[1])) {
          let $pieceToMove = $("ul[data-pos="+that.columns[0] + "]").children().first();
          // let $pieceToMove = that.$dom.find("data[pos]='" + that.columns[0]);
          $currentTarget.prepend($pieceToMove);
          that.columns = [];
        }
        else {
          that.columns = [];
        }
      }
    });

  }

}

module.exports = HanoiView
