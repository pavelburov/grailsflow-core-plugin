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


<!--
	Template for displaying ProcessVariables on the Wait node form

	Template parameters:

  required:	
		* variables  						Map of variableName -> variable bean
		
  Variable bean has following properties:
     - ProcessVariableDef properties:
         - name			   			String variable name
         - type                     String variable type
         - label			   		Map of languageID -> variable label
         - description				Map of languageID -> variable description
         - required					Boolean variable required
         - view						VariableView view of variable
     - value						Object current variable value
     - visibility					int variable visibility for current node
 -->

<gf:messageBundle bundle="grailsflow.worklist" var="msgs"/>
<h3>${msgs['grailsflow.label.processVars']}</h3>

<g:setProvider library="jquery"/>
<r:require modules="grailsflowCalendar" />

<g:each in="${variables.values()}" var="variable">

        <g:set var="readOnly" value="${variable.visibility == com.jcatalog.grailsflow.utils.ConstantUtils.READ_ONLY}"/>
        <g:set var="required" value="${variable.required != null ? variable.required : false}"/>
        <g:set var="view" value="${variable.view}"/>
        <g:set var="parameterName" value="var_${variable.name}"/>

        <div class="form-group">
          <label class="col-sm-2 col-xs-2 col-md-2 col-lg-2  control-label">
            <gf:translatedValue translations="${variable.label}" default="${variable.name}" />
            <g:if test="${required}">*</g:if>
          </label>
          <div class="col-sm-10 col-md-10 col-lg-10 col-xs-10">
            <gf:customizingTemplate template="${variable.view?.template}"
                defaultTemplate="${com.jcatalog.grailsflow.model.view.VariableView.getDefaultTemplateForType(variable.type)}"
                model="[variable: variable, view: variable.view, parameterName: parameterName]"/>
            <br/>
            <p class="help-block">
              <gf:translatedValue translations="${variable.description}" default="" />
            </p>
          </div>
        </div>
</g:each>
