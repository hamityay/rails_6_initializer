module.exports = {
  test: /\.sass(\.haml)?$/,
  use: [
    'style-loader',
    'css-loader',
    {
      loader: 'sass-loader',
      options: {
        sassOptions: {
          indentedSyntax: true
        }
      }
    }
  ]
}

