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
         <title>${msgs['grailsflow.title.editTypes']}</title>
    </head>
    <body>
      <div class="row">
        <div class="col-md-12 col-xs-12 col-lg-12">
          <h3>${msgs['grailsflow.label.editTypes']}</h3>
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
                  <g:actionSubmit action="createProcess" value="${common['grailsflow.command.add']}" class="btn btn-primary" style="margin-bottom:8px;"/>

            <table class="table table-bordered" width="100%">
             <thead>
               <tr>
                  <g:sortableColumn property="type" title="${msgs['grailsflow.label.processID']}" />
                  <th>${msgs['grailsflow.label.description']}</th>
                  <th>${msgs['grailsflow.label.operation']}</th>
               </tr>
             </thead>
             <tbody>
               <g:each in="${processClasses}" var="item" status="i">
                 <g:if test="${scripts[item]}">
                   <tr>
                     <td><g:set var="label" value="${gf.translatedValue(['translations': scripts[item].label, 'default': scripts[item].processType])}" scope="page" />${label?.encodeAsHTML()}</td>
                     <td><g:set var="description" value="${gf.translatedValue(['translations': scripts[item].description, 'default': ''])}" scope="page" />${description?.encodeAsHTML()}</td>
                     <td  style="white-space: nowrap;">
                       <g:link action="editProcessDef" controller="${params['controller']}" id="${scripts[item].processType}" title="${common['grailsflow.command.edit']}"  class="btn btn-sm btn-default">${common['grailsflow.command.edit']}</g:link>
                       <g:link action="deleteProcessDef" controller="${params['controller']}" id="${scripts[item].processType}"
                           onclick="return askConfirmation('${common['grailsflow.question.confirm']}');" title="${common['grailsflow.command.delete']}" class="btn btn-sm btn-default">${common['grailsflow.command.delete']}</g:link>
                     </td>
                   </tr>
                 </g:if>
                 <g:else>
                   <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                     <td>${item?.encodeAsHTML()}</td>
                     <td><font class="error">${msgs['grailsflow.message.script.invalid']}</font></td>
                     <td>
                       <g:link action="editProcessScript" controller="${params['controller']}" id="${item}" title="${common['grailsflow.command.edit']}"  class="btn btn-sm btn-default">${common['grailsflow.command.edit']}</g:link>
                       <g:link action="deleteProcessScript" controller="${params['controller']}" id="${item}"
                         onclick="return askConfirmation('${common['grailsflow.question.confirm']}');" title="${common['grailsflow.command.delete']}"  class="btn btn-sm btn-default">${common['grailsflow.command.delete']}</g:link>
                     </td>
                   </tr>
                 </g:else>
               </g:each>
             </tbody>
           </table>
            </div>
          </div>
          </g:form>

    </body>
</html>
