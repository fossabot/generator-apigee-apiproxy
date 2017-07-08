
const YoemanGenerator = require('yeoman-generator');
const chalk = require('chalk');
const yosay = require('yosay');

module.exports = class extends YoemanGenerator {
    prompting() {
    // Have Yeoman greet the user.
        this.log(yosay(
            'Welcome to the scrumtrulescent ' + chalk.red('<%= projectName %>') + ' generator!'
        ));

        const prompts = [{
            type: 'confirm',
            name: 'someAnswer',
            message: 'Would you like to enable this option?',
            default: true
        }];

        return this.prompt(prompts).then((props) => {
            // To access props later use this.props.someAnswer;
            this.props = props;
        });
    }

    writing() {
        this.fs.copy(
            this.templatePath('dummyfile.txt'),
            this.destinationPath('dummyfile.txt')
        );
    }

    default() {
        this.composeWith(require.resolve('../nsp'));
    }

    install() {
        this.installDependencies();
    }
};
