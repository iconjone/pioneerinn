const https = require('https');
const fs = require('fs');
const path = require('path');

const dir = './assets';
if (!fs.existsSync(dir)) fs.mkdirSync(dir);

const imageUrls = [
    "https://pioneerinn.us/wp-content/uploads/2020/12/Logo.png",
    "https://pioneerinn.us/wp-content/uploads/2020/12/16.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/Lobby1.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/Lobby2.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/Lobby3.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/Lobby4.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/MG_4196.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/PioneerInnSmokeFreeHotel.png",
    // All Gallery Images
    "https://pioneerinn.us/wp-content/uploads/2020/12/1.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/2.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/3.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/4.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/5.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/6.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/7.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/8.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/10.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/11.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/12.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/13.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/14.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/15.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/17.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/18.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/19.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/20.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/21.jpg",
    "https://pioneerinn.us/wp-content/uploads/2020/12/22.jpg"
];

console.log(`Starting download of ${imageUrls.length} images...`);

imageUrls.forEach(url => {
    const filename = path.basename(url);
    const filePath = path.join(dir, filename);
    
    https.get(url, (res) => {
        const fileStream = fs.createWriteStream(filePath);
        res.pipe(fileStream);
        fileStream.on('finish', () => {
            fileStream.close();
            console.log(`Downloaded: ${filename}`);
        });
    }).on('error', (err) => {
        console.error(`Error downloading ${url}: ${err.message}`);
    });
});