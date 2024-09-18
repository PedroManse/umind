export class Pipe<I, O> {
  private fn: (i: I)=>O;
	constructor(f1: (i: I)=>O) {
		this.fn = f1;
  }
	p<O2>(f2: (i: O)=>O2): Pipe<I, O2> {
    return new Pipe((i: I)=> f2(this.fn(i)) );
  }
  done(): (i: I)=>O {
    return this.fn;
  }
}
