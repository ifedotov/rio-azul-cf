component {
  function init(things) {
    this.things = arguments.things;
    return this;
  }
  
  public any function list() {
    return this.things;
  }

  public any function add(thing) {
    arrayAppend(this.things, thing);
    return this.things;
  }

  public any function delete(idx) {
    arrayDeleteAt(this.things, arguments.idx);
    return this.things;
  }

  public any function get(idx) {
    return this.things[arguments.idx];
  }

  public any function update(thing, idx) {
    this.things[arguments.idx] = arguments.thing;
    return this.things;
  }

}