localCSS = require './style'

module.exports = React.createClass

  # -- States & Properties
  propTypes:
    active    : React.PropTypes.bool
    className : React.PropTypes.string
    disabled  : React.PropTypes.bool
    hidden    : React.PropTypes.bool
    label     : React.PropTypes.string.isRequired
    onActive  : React.PropTypes.func
    tabIndex  : React.PropTypes.number

  getDefaultProps: ->
    className : ""

  # -- Lifecycle
  componentDidMount: ->
    @active @props.active

  componentWillReceiveProps: (next_props) ->
    @active next_props.active if next_props.active

  # -- Render
  render: ->
    className  = @props.className
    className += ' active'    if @props.active
    className += ' disabled'  if @props.disabled
    className += ' hidden'    if @props.hidden
    <section data-react-toolbox='tab'
             className={localCSS.tab + ' ' + className}
             data-flex='vertical'
             tabIndex={@props.tabIndex}>
      { @props.children }
    </section>

  # -- Extends
  active: (value) ->
    @setState active: value
    @props.onActive? @ if value
