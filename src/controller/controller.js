exports.controller = ({ repository }) => ({
    home (req, res)  {
        const {nome} = req.query
        const html = repository.execute(nome)
        res.send(html)
        res.end()
    }
})