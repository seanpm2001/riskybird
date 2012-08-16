/**
 * Main web app code.
 *
 *
 *
 *   This file is part of RiskyBird
 *
 *   RiskyBird is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU Affero General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   RiskyBird is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU Affero General Public License for more details.
 *
 *   You should have received a copy of the GNU Affero General Public License
 *   along with RiskyBird.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @author Julien Verlaguet
 * @author Alok Menghrajani
 */

import stdlib.themes.bootstrap

/**
 * Renders the main page.
 *
 * The page contains an input forms field and a few example links.
 *
 * - the svg rendering gets stuffed in #parser_output
 * - the lint results are put in #lint_output
 */
function resource display(string r) {
  Resource.styled_page(
    "RegexpLint",
    ["/resources/riskybird.css"],
    <>
      <div id="wrap"><div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
          <div class="container">
            <a href="/" class="brand">RegexpLint</a>
          </div>
        </div>
      </div>

      <div id="main" class="container" onready={function(_){check_regexp()}}>
        <section id="info">
          <p class="lead">
            RegexpLint helps you understand and analyze regular expressions.<br/>
            We graphically render regular expressions and point out common pitfalls.
          </p>
          <p>
            Try <a href="/?r=%5ea.*%7cb%24">example 1</a> ·
            <a href="/?r=a%28bc%3F%7C%5Bd-e%5D%29%7B4%2C%7Df">example 2</a> ·
            <a href="/?r=(abc).(efg).%5c2%5c4">example 3</a> or
          </p>
        </section>

        <section id="go">
            <div class="row">
              <div class="span12">
                <div class="input">
                  <input
                    class="xxlarge"
                    type="text"
                    id=#regexp
                    placeholder="Enter a regular expression"
                    style="width: 80%"
                    value="{r}"
                    onnewline={function(_){check_regexp()}}
                  />
                </div>
                <br/>
              </div>
            </div>
            <div class="row">
              <div class="span12">
                <div id=#string_output/>
                <div id=#parser_output/>
              </div>
            </div>
            <div class="row" style="margin-top: 12px">
              <div class="span4" id=#lint_output/>
              <div class="span8">&nbsp;</div>
            </div>
        </section>
      </div>
      <div class="push"></div>
      </div>
      {display_footer()}
    </>
  )
}

/**
 * Our nice little about page.
 */
function resource display_about() {
  Resource.styled_page(
    "RegexpLint | About",
    ["/resources/riskybird.css"],
    <>
      <div id="wrap"><div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
          <div class="container">
            <a href="/" class="brand">RegexpLint</a>
          </div>
        </div>
      </div>
      <div id="main" class="container">
        <section id="about">
          <div class="row">
            <div class="span4">&nbsp;</div>
            <div class="span8">
              <p class="lead">About</p>
              <p>
                RegexpLint was written by a few Facebook engineers on their spare
                time. The purpose of this tool is to help fellow engineers understand,
                write and audit regular expressions.
              </p>
              <p>
                Our code is written in <a href="http://www.opalang.org/">Opa</a>, a modern web framework. We decided to use
                to use this framework for various reasons, one of them being that it makes writing parsers very easy!
                We <a href="http://alokmenghrajani/riskybird/">open sourced</a> all the code to encourage people to look at it,
                improve it or build on it.
              </p>
              <p>
                What's next? Peer <a href="http://regexplint.userecho.com/">feedback</a> is going to
                help us decide what we are going to build next!
              </p>
            </div>
          </div>
          <div class="row">
            <div class="span2">&nbsp;</div>
            <div class="span2">
              <img src="http://graph.facebook.com/julien.verlaguet/picture"
                style="border: 1px solid #0E0E0E; border-radius: 3px 3px 3px 3px;
                  box-shadow: 0 8px 5px -4px rgba(0, 0, 0, 0.3);
                  margin: 12px;"/>
            </div>
            <div class="span8" style="margin-top: 12px">
              <h3>Julien Verlaguet</h3>
              <p>Wrote the parser.</p>
            </div>
          </div>
          <div class="row">
            <div class="span2">&nbsp;</div>
            <div class="span2">
              <img src="http://graph.facebook.com/erling/picture"
                style="border: 1px solid #0E0E0E; border-radius: 3px 3px 3px 3px;
                  box-shadow: 0 8px 5px -4px rgba(0, 0, 0, 0.3);
                  margin: 12px;"/>
            </div>
            <div class="span8" style="margin-top: 12px">
              <h3>Erling Ellingsen</h3>
              <p>Found bugs, helped fix them and will continue to find more.</p>
            </div>
          </div>
          <div class="row">
            <div class="span2">&nbsp;</div>
            <div class="span2">
              <img src="http://graph.facebook.com/alok/picture"
                style="border: 1px solid #0E0E0E; border-radius: 3px 3px 3px 3px;
                  box-shadow: 0 8px 5px -4px rgba(0, 0, 0, 0.3);
                  margin: 12px;"/>
            </div>
            <div class="span8" style="margin-top: 12px">
              <h3>Alok Menghrajani</h3>
              <p>Worked on the lint engine.</p>
            </div>
          </div>
        </section>
      </div>
      <div class="push"></div>
      </div>
      {display_footer()}
    </>
  )
}

/**
 * Shared footer.
 */
function xhtml display_footer() {
  <footer class="footer">
    <p>
      <a href="/about">About</a> ·
      <a href="http://www.opalang.org/">Written in Opa</a> ·
      <a href="http://github.com/alokmenghrajani/riskybird/">Fork on github.com</a> ·
      <a href="http://regexplint.userecho.com/">Provide Feedback</a>
    </p>
    <div class="social-buttons">
      <iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.facebook.com%2FRegexpLint&amp;send=false&layout=button_count&amp;width=75&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=21&amp;appId=202562833203260" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:75px; height:21px;" allowTransparency="true"></iframe>
      <span style="padding-left: 20px">&nbsp;</span>
      <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://regexp.quaxio.com/" data-via="alokmenghrajani">Tweet</a>
      <script>{"!function(d,s,id)\{var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id))\{js=d.createElement(s);js.id=id;js.src='//platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);\}\}(document,'script','twitter-wjs');"}</script>
    </div>
    <script type="text/javascript">{"var _gaq=_gaq||[];_gaq.push(['_setAccount','UA-2373559-10']);_gaq.push(['_trackPageview']);(function()\{var ga=document.createElement('script');ga.type='text/javascript';ga.async=true;ga.src=('https:'==document.location.protocol?'https://ssl':'http://www')+'.google-analytics.com/ga.js';var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(ga,s);\})();"}</script>
  </footer>
}

/**
 * Runs the lint engine.
 */
function void linter_run(option(regexp) tree_opt) {
  l =
    match(tree_opt) {
      case {none}: {none}
      case {some: tree}:
        lint_result status = RegexpLinter.regexp(tree)
        RegexpLinterRender.render(status)
     }
  if (Option.is_some(l)) {
    #lint_output = Option.get(l)
  } else {
    #lint_output = <></>
  }
}

/**
 * Parses the regexp and then:
 * - renders it (using the SvgPrinter)
 * - runs it throught the lint engine
 */
client function void check_regexp() {
  string regexp = Dom.get_value(#regexp)

  // easter egg
  if (regexp == "xkcd") {
    #parser_output = <img src="http://imgs.xkcd.com/comics/regular_expressions.png "/>
    #string_output = <>xkcd</>
    #lint_output = <></>
  } else {
    parsed_regexp = RegexpParser.parse(regexp)
    match (parsed_regexp) {
      case {none}:
        #string_output = <>{regexp}</>
      case {~some}:
        #string_output = RegexpHighlightStringPrinter.pretty_print(some)
    }
    #parser_output = RegexpSvgPrinter.pretty_print(parsed_regexp)
    linter_run(parsed_regexp)
  }
}

function resource start(Uri.relative uri) {
  match (uri) {
    case {path:{nil}, query:{nil} ...}:
      display("")
    case {path:{nil}, query:[("r",v)] ...}:
      display(v)
    case {path:["about"] ...}:
      display_about()
    case {~path ...}:
      my_log(path)
      Resource.styled_page("Lost?", [], <>* &lt;------- you are here</>)
  }
}

Server.start(
  Server.http,
  [
    {resources: @static_include_directory("resources")},
    {dispatch: start}
  ]
)
