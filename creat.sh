if [ $1 ]; then
cat> $1.js <<EOF
!(async () => {
        let filename = process.mainModule.filename.match(/(\w+).js/)[1]
        let dirname = process.mainModule.path
        let type = filename.split('_')[0]
        if (['js', 'jx', 'jr', 'jw'].includes(type)) {
            type = 'jd'
        }
        let qitoqito = require(\`\${dirname}/parse/\${type}/\${filename}\`)
        let kedaya = new qitoqito()
        await kedaya.init({})
    }
)().catch((e) => {
    console.log(e.message)
})
EOF
fi
