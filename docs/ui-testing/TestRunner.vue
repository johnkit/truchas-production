<template>
  <div class="sequence">
    <div v-if="sequence">
      <h4>{{sequence.name}}</h4>
      <div v-for="(step,index) in sequence.steps" :key="index">
        <div class="step"  :class="{minimized: index != stepNumber}">
          <div class="step-header">{{index + 1}}. {{step.title}}</div>
          <div class="step-content">
            <p><strong>Action: </strong><span v-html="step.action"></span></p>

            <p v-if="step.expect"><strong>Expect: </strong><span v-html="step.expect"></span></p>

            <div>
            <button :disabled="stepNumber == 0" @click="stepNumber--">Back</button>
            <button :disabled="isNextDisabled" @click="stepNumber++">Next</button>
            </div>
          </div>
        </div>
      </div>
      <div>
      </div>
    </div>
  </div>
</template>

<script>
module.exports = {
  props: ['test'],
  data: function() {
    return {
      sequence: null,
      stepNumber: 0,
    }
  },  // data
  methods: {
    startTest: function() {
      // console.log(`TestRunner updating test ${this.test}`);
      let ts = Date.now();
      let filename = `./data/${this.test}.json?${ts}`;
      axios.get(filename)
        .then(response => {
          this.sequence = response.data;
          this.stepNumber = 0;
        })
        .catch(function(error) {console.error(error)});
    },  // startTest()
  },  // methods
  computed: {
    isNextDisabled: function() {
      let last = this.sequence.steps.length - 1;
      return this.stepNumber === last;
    }
  },  // computed
  mounted() {
    this.startTest();
  },  // mounted()
  watch: {
    test: function(newVal, oldVal) {
      // console.log(`TestRunner: test changed to ${newVal}`);
      this.startTest();
    }
  },  // watch
}
</script>

<style scoped>
  button {
    margin-right: 1em;
  }
</style>
