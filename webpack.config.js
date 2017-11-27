var path = require("path")
var webpack = require("webpack")
var BundleTracker = require('webpack-bundle-tracker');
var ExtractTextPlugin = require("extract-text-webpack-plugin");

module.exports = {
  context: __dirname,
  entry: {
    main: "./apps/zblog/webpack_js/main.js",
  }, //entry文件的位置
  output: {
    path: path.resolve('./apps/zblog/static/bundles'), //和settings.py里的WEBPACK_LOADER的设置对应
    filename: "[name].dev.js"
  },
  externals:{
    'jquery':'window.$'
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
      {test: /\.jpg$/, loader: 'url-loader?limit=100000'},
      { test: /\.eot(\?v=\d+\.\d+\.\d+)?$/, loader: "file" },
      { test: /\.(woff|woff2)$/, loader:"url?prefix=font/&limit=5000" },
      { test: /\.ttf(\?v=\d+\.\d+\.\d+)?$/, loader: "url?limit=10000&mimetype=application/octet-stream" },
      { test: /\.svg(\?v=\d+\.\d+\.\d+)?$/, loader: "url?limit=10000&mimetype=image/svg+xml" },
      {test: require.resolve('jquery'), loader:'expose?jQuery!expose!$'}
    ]
  },
  resolve: {
    alias: {
        'jquery': 'jquery/dist/jquery.min.js',
    }
  },
  plugins: [
    new BundleTracker({filename: './zblogsite/webpack-stats.json'}),
    new ExtractTextPlugin("main.css"),
    new webpack.ProvidePlugin({
        $: "jquery",
        jQuery: "jquery",
        "window.jQuery":"jquery",
        "boostrap": "bootstrap"
    }),
  ],
  devtool: "eval-source-map"
};
