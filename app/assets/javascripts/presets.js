const main = () => {
    const windowWidth = window.innerWidth;
    const windowHeight = window.innerHeight;

    const canvas = document.getElementById('myCanvas');

    canvas.width = windowWidth / 2;
    canvas.height = windowWidth / 2;

    const context = canvas.getContext('2d');
    const tileSize = 20;

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }


    function generateLines(ctx, tileSize, width, height) {
        ctx.clearRect(0, 0, width, height);

        for (let y = 0; y <= (height / tileSize); y++) {
            for (let x = 0; x <= (width / tileSize); x++) {
                const leftToRight = Math.random() >= .5;
                const xOffset = x * tileSize;
                const yOffset = y * tileSize;

                ctx.beginPath();
                ctx.strokeStyle = `rgb(0,
                    ${Math.floor(255 - (y * 10))}, 
                    ${Math.floor(255 - (x * 10))})`;
                if (leftToRight) {
                    // draw  right to left line = \
                    ctx.moveTo(xOffset, yOffset);
                    ctx.lineTo(xOffset + tileSize, yOffset + tileSize);
                } else {
                    // draw  left to right line = /
                    ctx.moveTo(xOffset + tileSize, yOffset);
                    ctx.lineTo(xOffset, yOffset + tileSize);
                }

                ctx.stroke();
            }
        }
    }

    generateLines(context, tileSize, windowWidth, windowWidth);

    canvas.addEventListener("click", function () {
        generateLines(context, tileSize, canvas.width, canvas.height);
    });
}



document.addEventListener('DOMContentLoaded', main);