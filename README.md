# React + TypeScript + Vite

This template provides a minimal setup to get React working in Vite with HMR and some ESLint rules.

Currently, two official plugins are available:

- [@vitejs/plugin-react](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react/README.md) uses [Babel](https://babeljs.io/) for Fast Refresh
- [@vitejs/plugin-react-swc](https://github.com/vitejs/vite-plugin-react-swc) uses [SWC](https://swc.rs/) for Fast Refresh

## Expanding the ESLint configuration

If you are developing a production application, we recommend updating the configuration to enable type aware lint rules:

- Configure the top-level `parserOptions` property like this:

```js
   parserOptions: {
    ecmaVersion: 'latest',
    sourceType: 'module',
    project: ['./tsconfig.json', './tsconfig.node.json'],
    tsconfigRootDir: __dirname,
   },
```

- Replace `plugin:@typescript-eslint/recommended` to `plugin:@typescript-eslint/recommended-type-checked` or `plugin:@typescript-eslint/strict-type-checked`
- Optionally add `plugin:@typescript-eslint/stylistic-type-checked`
- Install [eslint-plugin-react](https://github.com/jsx-eslint/eslint-plugin-react) and add `plugin:react/recommended` & `plugin:react/jsx-runtime` to the `extends` list


 "@faker-js/faker": "^7.6.0",
    "@nomiclabs/hardhat-ethers": "^2.2.1",
    "@openzeppelin/contracts": "^4.8.0",
    "axios": "^1.2.2",
    "bootstrap": "^5.2.3",
    "chai": "^4.3.7",
    "console-feed": "^3.5.0",
    "dotenv": "^16.0.3",
    "ethers": "^5.7.2",
    "hardhat": "^2.12.5",
    "hardhat-contract-sizer": "^2.6.1",
    "hardhat-deploy": "^0.11.22",
    "hardhat-deploy-ethers": "^0.3.0-beta.13",
    "hardhat-gas-reporter": "^1.0.9",
    "i": "^0.3.7",
    "magic-sdk": "^13.1.0",
    "mocha": "^10.2.0",
    "prettier": "^2.8.2",
    "prettier-plugin-solidity": "^1.1.1",
    "react": "^17.0.2",
    "react-bootstrap": "^2.9.1",
    "react-dom": "^17.0.2",
    "react-icons": "^4.11.0",
    "react-router-dom": "^6.17.0",
    "react-scripts": "^5.0.1",
    "react-toastify": "^9.1.3",
    "reactstrap": "^9.2.0",
    "solhint": "^3.3.7",
    "solidity-coverage": "^0.8.2",
    "web-vitals": "^2.1.4",
    "yarn": "^1.22.19"