/**
 * Configure your Gatsby site with this file.
 *
 * See: https://www.gatsbyjs.org/docs/gatsby-config/
 *
 * All configuration related things are here
 *
 * This is configuration file
 */

module.exports = {
  siteMetadata: {
    siteUrl: `https://gatsby-theme-i18n-react-intl.netlify.app`,
    title: "gatsby-theme-i18n-react-intl",
    description: `Default example for i18n with react-intl`,
    author: `LekoArts`,
  },
  plugins: [
    `gatsby-plugin-react-helmet`,
    {
      resolve: "gatsby-plugin-html-attributes",
      options: {
        lang: "zxx",
      },
    },
    {
      resolve: `gatsby-plugin-typescript`,
      options: {
        isTSX: true, // defaults to false
        jsxPragma: `jsx`, // defaults to "React"
        allExtensions: true, // defaults to false
      },
    },
    {
        resolve: `gatsby-theme-i18n`,
        options: {
          defaultLang: `ar`,
          configPath: require.resolve(`./i18n/config.json`),
        },
      },
    {
      resolve: `gatsby-theme-i18n-react-intl`,
      options: {
        defaultLocale: `./i18n/react-intl/ar.json`,

      },
    }
  ],
}
