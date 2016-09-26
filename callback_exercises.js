class Clock {
  constructor() {
    let date = new Date();
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();

      (this._tick.bind(this), 1000);
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
  }

  printTime(params) {
    console.log(params);
    // Format the time in HH:MM:SS
    // Use console.log to print it.
  }

  _tick() {
    // 1. Increment the time by one second.
    this.seconds += 1;
    if (this.seconds === 60) {
      this.minutes += 1;
      this.seconds = 0;
    }else if (this.minutes === 60) {
      this.hours += 1;
      this.minutes = 0;
    } else if (this.hours === 13) {
      this.hours = 1;
    }

    // let MyDateString = ('0' + this.hours.slice(-2)) + ' : '
    //          + ('0' + this.minutes.slice(-2)) + ' : '
    //          + ('0' + this.seconds.slice(-2));

    console.log ("this.seconds");
    console.log (this.seconds);
    console.log ("this.minutes");
    console.log (this.minutes);
    console.log ("this.hours");
    console.log (this.hours);

    this.printTime(`${this.hours} :${this.minutes} :${this.seconds}`);

    // 2. Call printTime.
  }
}

const clock = new Clock();
