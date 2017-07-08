
const YoemanGenerator = require('yeoman-generator');
const rootPkg = require('../../package.json');

module.exports = class extends YoemanGenerator {
    constructor(args, options) {
        super(args, options);

        this.option('generateInto', {
            type: String,
            required: false,
            defaults: '',
            desc: 'Relocate the location of the generated files.'
        });
    }

    writing() {
        this.fs.extendJSON(this.destinationPath(this.options.generateInto, 'package.json'), {
            devDependencies: {
                nsp: rootPkg.devDependencies.nsp
            },
            scripts: {
                prepublish: 'nsp check -o summary',
                posttest: 'nsp check -o summary'
            }
        });
    }
};
