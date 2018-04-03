// const main = () => {
//     const windowWidth = window.innerWidth;
//     const windowHeight = window.innerHeight;
//
//     const canvas = document.getElementById('myCanvas');
//
//     canvas.width = windowWidth / 2;
//     canvas.height = windowWidth / 2;
//
//     const context = canvas.getContext('2d');
//     const tileSize = 20;
//
//     function getRandomInt(min, max) {
//         return Math.floor(Math.random() * (max - min + 1)) + min;
//     }
//
//
//     function generateLines(ctx, tileSize, width, height) {
//         ctx.clearRect(0, 0, width, height);
//
//         for (let y = 0; y <= (height / tileSize); y++) {
//             for (let x = 0; x <= (width / tileSize); x++) {
//                 const leftToRight = Math.random() >= .5;
//                 const xOffset = x * tileSize;
//                 const yOffset = y * tileSize;
//
//                 ctx.beginPath();
//                 ctx.strokeStyle = `rgb(0,
//                     ${Math.floor(255 - (y * 10))},
//                     ${Math.floor(255 - (x * 10))})`;
//                 if (leftToRight) {
//                     // draw  right to left line = \
//                     ctx.moveTo(xOffset, yOffset);
//                     ctx.lineTo(xOffset + tileSize, yOffset + tileSize);
//                 } else {
//                     // draw  left to right line = /
//                     ctx.moveTo(xOffset + tileSize, yOffset);
//                     ctx.lineTo(xOffset, yOffset + tileSize);
//                 }
//
//                 ctx.stroke();
//             }
//         }
//     }
//
//     generateLines(context, tileSize, windowWidth, windowWidth);
//
//     canvas.addEventListener("click", function () {
//         generateLines(context, tileSize, canvas.width, canvas.height);
//     });
// }

const fractalTree = () => {



    function draw(startX, startY, len, angle, branchWidth, ctx) {
        ctx.strokeStyle = "darkgreen";
        ctx.fillStyle = "green";
        ctx.lineWidth = branchWidth;

        ctx.beginPath();
        ctx.save();

        ctx.translate(startX, startY);
        ctx.rotate(angle * Math.PI / 180);
        ctx.moveTo(0, 0);
        // ctx.lineTo(0, -len);
        if(angle > 0) {
            ctx.bezierCurveTo(10, -len/2, 10, -len/2, 0, -len);
        } else {
            ctx.bezierCurveTo(-10, -len/2, -10, -len/2, 0, -len);
        }
        ctx.stroke();

        if (len < 10) {
            ctx.beginPath();
            ctx.arc(0, -len, 10, 0, Math.PI/2);
            ctx.fill();
            ctx.restore();
            return;
        }

        draw(0, -len, len*0.8, angle+10, branchWidth*0.8,ctx);
        draw(0, -len, len*0.8, angle-10, branchWidth*0.8,ctx);
        ctx.restore();
    }

    const windowWidth = window.innerWidth;
    const windowHeight = window.innerHeight;

    const canvas = document.getElementById('myCanvas');

    canvas.width = windowWidth/2;
    canvas.height = windowHeight/2;

    const context = canvas.getContext('2d');
    context.shadowBlur = 15;
    context.shadowColor = "rgba(0,0,0,0.8)";

    draw(350, 500, 100, 3, 10, context);
}


document.addEventListener('DOMContentLoaded', fractalTree);