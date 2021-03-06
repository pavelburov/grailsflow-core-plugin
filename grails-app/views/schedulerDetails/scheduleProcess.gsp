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
  <gf:messageBundle bundle="grailsflow.common" var="common"/>
  <gf:messageBundle bundle="grailsflow.schedulerDetails" var="msgs"/>
  <meta name="layout" content="grailsflow"/>
  <g:render plugin="grailsflow" template="/commons/global"/>
  <title>${msgs['grailsflow.title.scheduleProcess']}</title>
  <r:script type="text/javascript">
      function changeProcessType(value) {
        // Generate Ajax request to get necessary fields
        ${g.remoteFunction(controller: params['controller'], action: "updateVariables",
          update: 'variablesForm', params: "'type='+value")}

    }

  </r:script>
</head>

<body>
<div class="row">
  <div class="col-md-12 col-xs-12 col-sm-12 col-lg-12">
    <h3>${msgs['grailsflow.label.scheduleProcess']}</h3>
  </div>
</div>

<div class="row">
  <div class="col-md-12 col-xs-12 col-sm-12 col-lg-12">
    <g:render plugin="grailsflow" template="/commons/messageInfo"/>
  </div>
</div>

<g:form class="form-horizontal" controller="${params['controller']}" method="POST" enctype="multipart/form-data">
  <div class="row">
    <div class="col-md-8 col-xs-8 col-lg-8">
      <h4>${msgs['grailsflow.label.processDetails']}</h4>

      <div class="form-group">
        <label class="col-sm-4 col-md-4 col-lg-4 col-xs-4 control-label" for="processClass">${msgs['grailsflow.label.processType']}</label>

        <div class="col-sm-8 col-md-8 col-lg-8 col-xs-8">
          <g:select id="processClass" from="${processClasses}" name='processID' class="form-control"
                    optionKey="${{ it.processType }}"
                    optionValue="${{ gf.translatedValue(translations: it.label, default: it.processType) }}"
                    value="${params.processID}" onchange="changeProcessType(this.value);"/>
        </div>
      </div>

      <h4>${msgs['grailsflow.label.processVariables']}</h4>

      <div id='variablesForm'>
        <g:render plugin="grailsflow" template="variablesForm"
                  model="[variables: processClass?.variables]"/>
      </div>

      <h4>${msgs['grailsflow.label.jobParams']}</h4>
      <g:render plugin="grailsflow" template="jobParametersForm"
                model="[bean: bean, repeatingInfo: repeatingInfo]"/>
    </div>
  </div>

  <div class="form-submit text-right">
    <g:actionSubmit action="showSchedulerDetails" value="${common['grailsflow.command.back']}" class="btn btn-link"/>
    <g:actionSubmit action="addJob" onclick="if (!checkRepeatInterval()) return false;"
                    value="${msgs['grailsflow.command.addJob']}" class="btn btn-primary"/>
  </div>
</g:form>

</body>
</html>
