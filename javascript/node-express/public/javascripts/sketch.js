// Dont fuck with
let inner;
let i;
function setup() {
  createCanvas(windowWidth, windowHeight, WEBGL);
}

function draw() {
  background(30, 60, 100);
  rotateX(HALF_PI*1.3);
  frameRate(60);
  loops = [];
  maximum = 11; // number of loops, greater than 11 will overlap
  if (loops.length < maximum) {
    for (i = 1; i < maximum; i++) {
        create(loops.length);
    }
  }
}

function Bubble(x) {
  inner = 200*sin((frameCount - 31*x)* .01);
  push();
  translate(0, 0, 110*sin((frameCount - 31*x)* 0.02) );
  fill(0,abs(180*sin((frameCount - 31*x)* 0.005)), abs(155*cos((frameCount - 31*x)* 0.005)));
  torus(inner, 16);
  // ellipseMode(CENTER);
  // ellipse(0, 0, inner*2, inner*2);
  balls = 3;
  pop();
}

function create(input) {
  loops.push(new Bubble(input));
}

