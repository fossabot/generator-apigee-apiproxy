const assert = require('yeoman-assert');
const helpers = require('yeoman-test');
const rootPkg = require('../package.json');

describe('node:nsp', () => {
    it('setup nsp in project', () => helpers.run(require.resolve('../generators/nsp')).then(() => {
        assert.jsonFileContent('package.json', {
            devDependencies: {
                nsp: rootPkg.devDependencies.nsp
            },
            scripts: {
                prepublish: 'nsp check -o summary',
                posttest: 'nsp check -o summary'
            }
        });
    }));
});
