baseline
baseline: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
            spec
                configuration: 'OSProcess'
                   with: [
                       spec
                           versionString: #'stable';
                           repository: 'http://ss3.gemtalksystems.com/ss/MetaRepoForPharo20' ];
                yourself.
            spec
                package: 'MonticelloFileTree-Core';
                package: 'MonticelloFileTree-Tests' with: [ spec requires: #('default') ];
                package: 'MonticelloFileTree-FileSystem-Utilities'
                    with: [ spec requires: #('MonticelloFileTree-Core') ];
                package: 'MonticelloFileTree-FileSystem-Tests'
                    with: [ spec requires: #('MonticelloFileTree-Tests') ];
                package: 'MonticelloFileTree-Git'
                    with: [ spec requires: #('MonticelloFileTree-Core' 'OSProcess') ];
                package: 'MonticelloFileTree-GitTests'
                    with: [ spec requires: #('MonticelloFileTree-Git' 'MonticelloFileTree-Tests') ];
                yourself.
            spec
                group: 'default' with: #('MonticelloFileTree-Core' 'MonticelloFileTree-FileSystem-Utilities');
                group: 'Git' with: #('MonticelloFileTree-Git');
                group: 'Tests' with: #('MonticelloFileTree-Tests' 'MonticelloFileTree-GitTests' 'MonticelloFileTree-FileSystem-Tests');
                group: 'TravisCI' with: #('Git' 'Tests');
                yourself ]
