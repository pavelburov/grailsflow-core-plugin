<%--
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--%>

<%--
  Template for displaying footer for the ProcessDetails UI

  Template parameters:

    * processDetails    processDetails

--%>

<gf:messageBundle bundle="grailsflow.common" var="common"/>
<gf:messageBundle bundle="grailsflow.processDetails" var="msgs"/>

<r:script>
  function openGraphic() {
    window.open("${g.createLink(controller: "process", action:'showGraphic')}?processID="+${processDetails.id}, "GraphicProcess", 'width=700, height=500, resizable=yes, scrollbars=yes, status=no');
    return false;
  }
</r:script>

<div class="buttons">

  <gf:backButton value="${common['grailsflow.command.back']}" class="button"/>
  &nbsp;&nbsp;
  <gf:refreshButton value="${common['grailsflow.command.refresh']}" class="button"/>
  &nbsp;&nbsp;
  <input type="button" class="button" value="${msgs['grailsflow.command.showGraphicEditor']}"
      onclick="openGraphic();"/>
</div>
