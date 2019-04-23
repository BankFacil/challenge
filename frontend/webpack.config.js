const path = require('path')
const HtmlWebpackPlugin = require('html-webpack-plugin')

module.exports = {
  mode: 'development',
  entry: ['webpack/hot/dev-server', './src/index.js'],
  output: {
    path: path.resolve(__dirname, 'build'),
    filename: 'bundle.js',
    publicPath: '/'
  },
  plugins: [
    new HtmlWebpackPlugin({
      title: 'Creditas Challenge',
      hash: true,
      favicon: 'public/favicon.ico',
      myPageHeader: 'Creditas Challenge',
      template: 'public/index.html',
      filename: 'index.html',
      files: {
        css: ['style.css']
      }
    })
  ],
  module: {
    rules: [
      {
        test: /\.css$/,
        use: ['style-loader', 'css-loader']
      }
    ]
  }
}
