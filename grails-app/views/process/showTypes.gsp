<!--
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->

<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
         <meta name="layout" content="grailsflow" />
         <g:render plugin="grailsflow" template="/commons/global"/>
         <gf:messageBundle bundle="grailsflow.common" var="common"/>
         <gf:messageBundle bundle="grailsflow.processTypes" var="msgs"/>
         <title>${msgs['grailsflow.title.startProcess']}</title>
    </head>
    <body>
      <div class="row">
        <div class="col-md-12 col-xs-12 col-lg-12">
          <h3>${msgs['grailsflow.label.startProcess']}</h3>
        </div>
      </div>

      <div class="row">
        <div class="col-md-12 col-xs-12 col-lg-12">
          <g:render plugin="grailsflow" template="/commons/messageInfo"/>
        </div>
      </div>

      <g:form controller="${params['controller']}" method="GET">
        <div class="row">
          <div class="col-md-12 col-xs-12 col-lg-12">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <g:sortableColumn property="type" title="${msgs['grailsflow.label.processID']}"/>
                  <th width="70%">${msgs['grailsflow.label.description']}</th>
                  <th>${msgs['grailsflow.label.operation']}</th>
                </tr>
              </thead>
              <tbody>
                <g:each in="${processClasses}" var="item" status="i">
                  <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                    <td><g:set var="label" value="${gf.translatedValue(['translations': item.label, 'default': item.processType])}" scope="page" />${label?.encodeAsHTML()}</td>
                    <td><g:set var="description" value="${gf.translatedValue(['translations': item.description, 'default': ''])}" scope="page" />${description?.encodeAsHTML()}</td>
                    <td>
                      <g:link action="startProcess" controller="${params['controller']}" id="${item.processType}" title="${common['grailsflow.command.start']}">${common['grailsflow.command.start']}</g:link>
                    </td>
                  </tr>
                </g:each>
              </tbody>
            </table>
          </div>
        </div>
      </g:form>

    </body>
</html>
