exports.controller = ({ repository, loadQueries }) => ({
  async query (req, res) {
    const { query, params, order, filter } = req.query
    let orderOb, filterObj
    if (order) {
      orderOb = {
        col: order[0],
        direction: order[1]
      }
    }
    if (filter) {
      filterObj = {
        col: filter[0],
        value: filter[1]
      }
    }
    const response = await repository.execute({ query: loadQueries[query], params, order: orderOb, filter: filterObj })
    // console.log(response)
    res.status(200).send(response)
    res.status(200)
    res.end()
  }
})
