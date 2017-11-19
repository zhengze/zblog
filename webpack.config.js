var path = require("path")
var webpack = require("webpack")
var BundleTracker = require('webpack-bundle-tracker');
var ExtractTextPlugin = require("extract-text-webpack-plugin");

module.exports = {
  context: __dirname,
  entry: {
    base: "./apps/zblog/webpack_js/base.js",
  }, //entry文件的位置
  output: {
    path: path.resolve('./apps/zblog/webpack_js/bundles'), //和settings.py里的WEBPACK_LOADER的设置对应
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
      },
      {test: /\.css$/, loader: ExtractTextPlugin.extract({ fallback: 'style-loader', use: 'css-loader' })},
      //{test: /\.css$/, loader: ExtractTextPlugin.extract('style-loader', 'css-loader')},
      {test: /\.jpg$/, loader: 'url-loader?limit=100000'}
    ]
  },
  plugins: [
    new BundleTracker({filename: './zblogsite/webpack-stats.json'}),
    new ExtractTextPlugin("base.css"),
  ],
  devtool: "eval-source-map"
};
