const main = () => {
    const windowWidth = window.innerWidth;
    const windowHeight = window.innerHeight;
    const canvas = document.getElementById('myCanvas');
    canvas.width = windowWidth / 2;
    canvas.height = windowHeight / 2;
    const context = canvas.getContext('2d');

    const tileSizeEl = document.querySelector('#square-size');
    const lineWidthEl = document.querySelector('#line-width');
    const tileSize = +tileSizeEl.value;
    const lineWidth = +lineWidthEl.value;

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }


    function generateLines(ctx, tileSize, lineWidth, width, height) {
        ctx.clearRect(0, 0, width, height);

        for (let y = 0; y <= (height / tileSize); y++) {
            for (let x = 0; x <= (width / tileSize); x++) {
                const leftToRight = Math.random() >= .5;
                const xOffset = x * tileSize;
                const yOffset = y * tileSize;

                ctx.beginPath();
                ctx.lineWidth = lineWidth;
                ctx.strokeStyle = `rgb(${getRandomInt(0, 255) + x},
                    ${getRandomInt(0, 255) - y},
                    ${getRandomInt(0, 255) - x}`;
                if (leftToRight) {
                    // draw  right to left line = \
                    ctx.moveTo(xOffset, yOffset);
                    ctx.lineTo(xOffset + tileSize, yOffset + tileSize);
                    ctx.rotate(getRandomInt(0,5) * Math.PI / 180);

                } else {
                    // draw  left to right line = /
                    ctx.moveTo(xOffset + tileSize, yOffset);
                    ctx.lineTo(xOffset, yOffset + tileSize);
                    ctx.rotate(getRandomInt(0,5) * Math.PI / 180);


                }


                ctx.stroke();
            }
        }
    }

    generateLines(context, tileSize, lineWidth, windowWidth, windowWidth);

    canvas.addEventListener("click", function () {
        generateLines(context, tileSize, lineWidth, canvas.width, canvas.height);
    });


    tileSizeEl.addEventListener('input', function (e) {
        generateLines(context, +e.target.value, +lineWidthEl.value, canvas.width, canvas.height)
    })

    lineWidthEl.addEventListener('input', function (e) {
        generateLines(context, +tileSizeEl.value, +e.target.value, canvas.width, canvas.height)
    })

    const drawStars = function (e) {
        const star = e.target.children[0]
        star.style.color = 'gold';
    }

    const stars = document.querySelectorAll('.star')

    for (let i = 0; i < stars.length; i++) {
        stars[i].addEventListener('mouseenter', drawStars)
    }

    document.querySelector('#stars-container').addEventListener('mouseleave', function () {
        for (let i = 0; i < stars.length; i++) {
            stars[i].children[0].style.color = 'black'
        }
    })
}


document.addEventListener('DOMContentLoaded', main);

