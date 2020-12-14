const resemble = require('resemblejs')

const fs = require('fs');
const path = require('path')

let compare = (path1, path2, path3, callback) => {
    let file1 = fs.readFileSync(path1)
    let file2 = fs.readFileSync(path2)

    let diff = resemble(file1).compareTo(file2).onComplete((data) => {
        fs.writeFileSync(path3, data.getBuffer())
        callback(data)
    })
}

//TAPS
//adb shell input tap 150 150
//adb shell input tap 350 150
//adb shell input tap 550 150
//adb shell input tap 850 150

if(process.argv[2] == undefined || process.argv[3] == undefined || process.argv[4] == undefined || process.argv[5] == undefined) {
    console.log("Missing arguments")
    process.exit(1)
}else {
    compare(process.argv[2], process.argv[3], process.argv[4], myData => {
        fs.appendFileSync('data.csv', "\n"+process.argv[5]+", "+myData.misMatchPercentage+", "+ myData.isSameDimensions+", "+ myData.analysisTime);
        /*
        isSameDimensions: true,
        dimensionDifference: { width: 0, height: 0 },
        rawMisMatchPercentage: 2.591386959876543,
        misMatchPercentage: '2.59',
        diffBounds: { top: 307, left: 0, bottom: 1880, right: 1079 },
        analysisTime: 101,
        */
    })
}