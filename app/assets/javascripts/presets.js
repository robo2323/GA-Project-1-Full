// color and alpha

var seedColor = '#111111';
var seedColorTwo = '#111111';
var seedColorThree = '#111111';
var seedColorFour = '#111111';
var bgColor = ['#111111'];

// inital number of seeds
var seeds = 300;

// angle (phi)
var angle = 90

// radius of the seed
var b1 = 100;
var b2 = 10;
var b3 = 10;
var b4 = 100;
var b5 = 50;

// scale
var zoom = 15;

// seed opacity
var opacity = 80;

/////////////////
var x = 2;
var y = 2;
var clicked = false;
var ang = 0.0;
var inc;

///////////////////////////

function setup() {
    const d = document;


    // all angles in degrees (0 .. 360)
    angleMode(DEGREES);


    // create a canvas that fills the window
    var cnv = createCanvas(windowWidth / 1.43, windowHeight / 1.43);
    cnv.parent('myCanvas');


    // only call draw when then gui is changed
    noLoop();

}

const getRandInt = (min, max) => {
    return Math.floor(Math.random() * (max - min + 1)) + min;
};

function draw() {

    background(bgColor);

    var c = color(seedColor);
    fill(red(c), green(c), blue(c), opacity);

    var r = b5 * zoom;

    push();

    translate(width / x, height / y);

    // rotate around the center while going outwards
    for (var i = 0; i < seeds; i++) {
        const num = Math.floor(Math.random() * 4);
        if (num === 0) {
            c = color(seedColor)
        }
        if (num === 1) {
            c = color(seedColorTwo)
        }
        if (num === 2) {
            c = color(seedColorThree)
        }
        if (num === 3) {
            c = color(seedColorFour)
        }

        if (clicked) {
            inc = TWO_PI / 100.0;
            b4 += sin(ang);
            b2 -= sin(ang);
            Math.random() <= 0.5 ? x += sin(ang) * 0.005 : x -= cos(ang) * 0.005;
            Math.random() <= 0.5 ? y += sin(ang) * 0.005 : y -= cos(ang) * 0.005;

            angle += tan(ang);
            zoom += sin(ang) * .05;
            ang += inc;
        }
        stroke(0, opacity * Math.random());

        fill(red(c), green(c), blue(c), opacity * Math.random());

        push();
        rotate(i * angle);
        var d = sqrt(i + 0.5) * zoom;
        bezier(d, b4, b5, b1, b2, b3, r, d);
        pop();
    }

    pop();

}

// dynamically adjust the canvas to the window
function windowResized() {
    resizeCanvas(windowWidth/1.43, windowHeight/1.43);
}

const main = () => {
    const d = document;
    const xEl = d.querySelector('#x')
    const yEl = d.querySelector('#y')
    const seedsRange = d.querySelector('#seeds');
    const angleRange = d.querySelector('#angle');
    const zoomRange = d.querySelector('#zoom');
    const opacityRange = d.querySelector('#opacity');
    const color1Picker = d.querySelector('#color-1');
    const color2Picker = d.querySelector('#color-2');
    const color3Picker = d.querySelector('#color-3');
    const color4Picker = d.querySelector('#color-4');
    const bgPicker = d.querySelector('#bgColor');
    const b1El = d.querySelector('#b1');
    const b2El = d.querySelector('#b2');
    const b3El = d.querySelector('#b3');
    const b4El = d.querySelector('#b4');
    const b5El = d.querySelector('#b5');
    b1 = +b1El.value;
    b2 = +b2El.value;
    b3 = +b3El.value;
    b4 = +b4El.value;
    b5 = +b5El.value;
    seeds = +seedsRange.value;
    zoom = +zoomRange.value;
    angle = +angleRange.value
    opacity = +opacityRange.value;
    seedColor = color1Picker.value;
    seedColorTwo = color2Picker.value;
    seedColorThree = color3Picker.value;
    seedColorFour = color4Picker.value;
    x = +xEl.value;
    y = +yEl.value;


    document.querySelector('#myCanvas').addEventListener('click', function () {
        clicked = !clicked;

        clicked ? loop() : noLoop()
        xEl.value = x;
        yEl.value = y;
        angleRange.value = angle;
        zoomRange.value = zoom;
        b2El.value = b2;
        b4El.value = b4;
    });

    seedsRange.addEventListener('input', function (e) {
        seeds = +e.target.value;
        draw();
    });

    angleRange.addEventListener('input', function (e) {
        angle = +e.target.value;
        draw();
    });

    zoomRange.addEventListener('input', function (e) {
        zoom = +e.target.value;
        draw();
    });

    opacityRange.addEventListener('input', function (e) {
        opacity = +e.target.value;
        draw();
    });

    color1Picker.addEventListener('input', function (e) {
        seedColor = e.target.value;
        draw();
    });

    color2Picker.addEventListener('input', function (e) {
        seedColorTwo = e.target.value;
        draw();
    });

    color3Picker.addEventListener('input', function (e) {
        seedColorThree = e.target.value;
        draw();
    });

    color4Picker.addEventListener('input', function (e) {
        seedColorFour = e.target.value;
        draw();
    });

    bgPicker.addEventListener('input', function (e) {
        bgColor = e.target.value;
        draw();
    });

    zoomRange.addEventListener('input', function (e) {
        zoom = +e.target.value;
        draw();
    });

    b1El.addEventListener('input', function (e) {
        b1 = +e.target.value;
        draw();
    });

    b2El.addEventListener('input', function (e) {
        b2 = +e.target.value;
        draw();
    });

    b3El.addEventListener('input', function (e) {
        b3 = +e.target.value;
        draw();
    });

    b4El.addEventListener('input', function (e) {
        b4 = +e.target.value;
        draw();
    });

    b5El.addEventListener('input', function (e) {
        b5 = +e.target.value;
        draw();
    });


    draw();


};


document.addEventListener('DOMContentLoaded', main);

