module.exports = {
  env: {
    browser: true,
    es2021: true
  },
  extends: [
    'prettier',
    'eslint:recommended',
    'plugin:astro/recommended',
    'standard-with-typescript'
  ],
  overrides: [],
  parserOptions: {
    ecmaVersion: 'latest',
    sourceType: 'module'
  },
  rules: {
    semi: ['error', 'always'],
    indent: ['off']
  }
};
