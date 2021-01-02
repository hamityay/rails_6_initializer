module.exports = {
  test: /\.scss(\.haml)?$/,
  use: [
    'style-loader',
    'css-loader',
    'sass-loader'
  ]
}
