<template>
  <div>
    <div class="step-header">{{index + 1}}. {{step.title}}</div>
    <div class="step-content">
      <template v-if="step.begin">
        <p v-if="step.action"><strong>Action: </strong><span v-html="step.action"></span></p>
        <p><strong>Select: </strong>either record or playback test script {{step.script}}</p>
        <div class="radio-group">
          <label><input type="radio" v-model="mode" value="record">Record</label>
          <label><input type="radio" v-model="mode" value="play">Play</label>
        </div>
        <div>
          <button :disabled="stepNumber == 0" @click="$emit('back')">Back</button>
          <button :disabled="mode == null " @click="$emit('next', mode)">Next</button>
        </div>
      </template>
      <template v-else-if="step.action">
        <p><strong>Action: </strong><span v-html="step.action"></span></p>
        <p v-if="step.expect"><strong>Expect: </strong><span v-html="step.expect"></span></p>
        <div>
          <button :disabled="stepNumber == 0" @click="$emit('back')">Back</button>
          <button :disabled="nextDisabled" @click="$emit('next')">Next</button>
        </div>
      </template>
    </div>
  </div>
</template>

<script>
module.exports = {
  props: ['index', 'step', 'stepNumber', 'nextDisabled'],
  events: ['back', 'next'],
  data: function() {
    return {
      mode: null,  // one of {null, record, play}
    }
  },  // data
  methods: {
  },  // methods
}
</script>

<style scoped>
  label {
    margin-right: 1em;
  }

  label input {
    margin-left: 0;
  }

  .radio-group {
    margin-bottom: 1em;
  }
</style>
