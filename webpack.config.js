var path = require("path")
var BundleTracker = require('webpack-bundle-tracker');

module.exports = {
  context: __dirname,
  entry: "./zblogsite/static/js/src/index", //entry文件的位置
  output: {
    path: path.resolve('./zblogsite/static/js/dist'), //和settings.py里的WEBPACK_LOADER的设置对应
    filename: "[name].dev.js"
  },
  module: { //使用babel loader
    loaders: [
      {
        test: /\.js$/,
        exclude: /(node_modules|bower_components)/,
        loader: 'babel-loader',
        query: {
          presets: ['es2015']
        }
      }
    ]
  },
  plugins: [
    new BundleTracker({filename: './webpack-stats.json'})
  ],
  devtool: "source-map"
};