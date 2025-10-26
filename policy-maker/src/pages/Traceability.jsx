import { useState } from 'react'

export default function Traceability() {
  const [selectedBatch, setSelectedBatch] = useState(null)

  const traceabilityStats = [
    { metric: 'Batches Traced', value: '45%', target: '80%', color: 'orange' },
    { metric: 'QR Codes Generated', value: '2.3M', target: '5M', color: 'blue' },
    { metric: 'Blockchain Records', value: '1.8M', target: '4M', color: 'purple' },
    { metric: 'Quality Failures', value: '2.1%', target: '<1%', color: 'red' }
  ]

  const recentBatches = [
    { 
      id: 'QR_SOY_001_2024', 
      crop: 'Soybean', 
      farmer: 'Rajesh Kumar', 
      fpo: 'Maharashtra FPO', 
      quantity: '500 kg',
      status: 'Verified',
      quality: 'Grade A',
      date: '2024-01-15'
    },
    { 
      id: 'QR_MUS_045_2024', 
      crop: 'Mustard', 
      farmer: 'Priya Sharma', 
      fpo: 'Rajasthan FPO', 
      quantity: '300 kg',
      status: 'In Transit',
      quality: 'Grade A',
      date: '2024-01-14'
    },
    { 
      id: 'QR_GRD_089_2024', 
      crop: 'Groundnut', 
      farmer: 'Suresh Patil', 
      fpo: 'Gujarat FPO', 
      quantity: '750 kg',
      status: 'Quality Check',
      quality: 'Grade B',
      date: '2024-01-13'
    }
  ]

  const qualityMetrics = [
    { parameter: 'Moisture Content', standard: '<8%', compliance: 94 },
    { parameter: 'Oil Content', standard: '>18%', compliance: 89 },
    { parameter: 'Foreign Matter', standard: '<2%', compliance: 96 },
    { parameter: 'Damaged Seeds', standard: '<5%', compliance: 91 }
  ]

  const blockchainData = [
    { stage: 'Farm Registration', records: 125000, verified: 98 },
    { stage: 'Sowing Data', records: 118000, verified: 95 },
    { stage: 'Harvest Records', records: 89000, verified: 97 },
    { stage: 'Quality Testing', records: 67000, verified: 99 },
    { stage: 'Storage Entry', records: 45000, verified: 96 },
    { stage: 'Final Sale', records: 23000, verified: 98 }
  ]

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="bg-gradient-to-r from-orange-600 to-purple-600 rounded-2xl p-6 text-white">
        <h1 className="text-3xl font-bold mb-2">Blockchain Traceability Dashboard</h1>
        <p className="text-white/90">End-to-end tracking of oilseed value chain with QR codes and blockchain</p>
      </div>

      {/* Traceability Stats */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        {traceabilityStats.map((stat, index) => (
          <div key={index} className="bg-white rounded-3xl shadow-xl p-6 border border-gray-100 hover:shadow-2xl transition-all duration-300">
            <div className="flex items-center justify-between mb-4">
              <h3 className="text-lg font-bold text-gray-900">{stat.metric}</h3>
              <div className={`w-4 h-4 rounded-full bg-${stat.color}-500`}></div>
            </div>
            <div className="space-y-2">
              <div className="flex justify-between items-center">
                <span className="text-3xl font-bold text-gray-900">{stat.value}</span>
                <span className="text-sm text-gray-500">/ {stat.target}</span>
              </div>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div 
                  className={`h-2 rounded-full bg-${stat.color}-500`}
                  style={{ width: stat.metric === 'Batches Traced' ? '56%' : '60%' }}
                ></div>
              </div>
            </div>
          </div>
        ))}
      </div>

      {/* QR Code Scanner */}
      <div className="bg-white rounded-2xl shadow-xl p-6 border border-gray-100">
        <h2 className="text-xl font-bold text-gray-900 mb-6 flex items-center">
          <span className="mr-3">📱</span>
          QR Code Batch Tracker
        </h2>
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
          <div className="bg-gradient-to-br from-blue-50 to-purple-50 rounded-2xl p-6 border border-blue-200">
            <div className="text-center">
              <div className="text-6xl mb-4">📱</div>
              <h3 className="text-xl font-bold text-gray-900 mb-2">Scan QR Code</h3>
              <p className="text-gray-600 mb-4">Scan any batch QR code to view complete traceability</p>
              <div className="bg-white rounded-xl p-4 border-2 border-dashed border-gray-300 mb-4">
                <input 
                  type="text" 
                  placeholder="Enter QR Code ID (e.g., QR_SOY_001_2024)"
                  className="w-full p-3 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
              </div>
              <button className="w-full bg-gradient-to-r from-blue-500 to-purple-500 text-white py-3 px-6 rounded-xl hover:from-blue-600 hover:to-purple-600 transition-all duration-300 font-semibold">
                Track Batch
              </button>
            </div>
          </div>

          <div className="space-y-4">
            <h3 className="text-lg font-bold text-gray-900">Recent Batches</h3>
            {recentBatches.map((batch, index) => (
              <div 
                key={index} 
                className="bg-gray-50 rounded-xl p-4 hover:bg-gray-100 cursor-pointer transition-all duration-200"
                onClick={() => setSelectedBatch(batch)}
              >
                <div className="flex items-center justify-between">
                  <div>
                    <p className="font-bold text-gray-900">{batch.id}</p>
                    <p className="text-sm text-gray-600">{batch.crop} • {batch.quantity}</p>
                  </div>
                  <span className={`px-3 py-1 rounded-full text-xs font-bold ${
                    batch.status === 'Verified' ? 'bg-green-100 text-green-800' :
                    batch.status === 'In Transit' ? 'bg-blue-100 text-blue-800' :
                    'bg-yellow-100 text-yellow-800'
                  }`}>
                    {batch.status}
                  </span>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* Quality Compliance */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <div className="bg-white rounded-2xl shadow-xl p-6 border border-gray-100">
          <h2 className="text-xl font-bold text-gray-900 mb-6 flex items-center">
            <span className="mr-3">🏆</span>
            Quality Compliance
          </h2>
          <div className="space-y-4">
            {qualityMetrics.map((metric, index) => (
              <div key={index} className="bg-gray-50 rounded-xl p-4">
                <div className="flex justify-between items-center mb-2">
                  <span className="font-semibold text-gray-900">{metric.parameter}</span>
                  <span className="text-sm text-gray-600">{metric.standard}</span>
                </div>
                <div className="flex items-center space-x-3">
                  <div className="flex-1 bg-gray-200 rounded-full h-2">
                    <div 
                      className={`h-2 rounded-full ${
                        metric.compliance >= 95 ? 'bg-green-500' :
                        metric.compliance >= 90 ? 'bg-yellow-500' : 'bg-red-500'
                      }`}
                      style={{ width: `${metric.compliance}%` }}
                    ></div>
                  </div>
                  <span className="text-sm font-bold text-gray-900">{metric.compliance}%</span>
                </div>
              </div>
            ))}
          </div>
        </div>

        <div className="bg-white rounded-2xl shadow-xl p-6 border border-gray-100">
          <h2 className="text-xl font-bold text-gray-900 mb-6 flex items-center">
            <span className="mr-3">🔗</span>
            Blockchain Verification
          </h2>
          <div className="space-y-4">
            {blockchainData.map((stage, index) => (
              <div key={index} className="flex items-center justify-between p-4 bg-gradient-to-r from-purple-50 to-blue-50 rounded-xl">
                <div>
                  <p className="font-semibold text-gray-900">{stage.stage}</p>
                  <p className="text-sm text-gray-600">{stage.records.toLocaleString()} records</p>
                </div>
                <div className="text-right">
                  <p className="text-lg font-bold text-purple-600">{stage.verified}%</p>
                  <p className="text-xs text-gray-500">Verified</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* Batch Details Modal */}
      {selectedBatch && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div className="bg-white rounded-2xl p-8 max-w-4xl w-full mx-4 shadow-2xl max-h-[90vh] overflow-y-auto">
            <div className="flex items-center justify-between mb-6">
              <h2 className="text-2xl font-bold text-gray-900">Batch Traceability: {selectedBatch.id}</h2>
              <button 
                onClick={() => setSelectedBatch(null)}
                className="text-gray-500 hover:text-gray-700 text-2xl"
              >
                ✕
              </button>
            </div>
            
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
              <div className="space-y-4">
                <div className="bg-blue-50 rounded-xl p-4">
                  <h3 className="font-semibold text-blue-900">Crop Details</h3>
                  <p className="text-lg font-bold text-blue-600">{selectedBatch.crop}</p>
                  <p className="text-sm text-blue-700">Quantity: {selectedBatch.quantity}</p>
                </div>
                <div className="bg-green-50 rounded-xl p-4">
                  <h3 className="font-semibold text-green-900">Farmer Information</h3>
                  <p className="text-lg font-bold text-green-600">{selectedBatch.farmer}</p>
                  <p className="text-sm text-green-700">FPO: {selectedBatch.fpo}</p>
                </div>
              </div>
              
              <div className="space-y-4">
                <div className="bg-purple-50 rounded-xl p-4">
                  <h3 className="font-semibold text-purple-900">Quality Grade</h3>
                  <p className="text-lg font-bold text-purple-600">{selectedBatch.quality}</p>
                  <p className="text-sm text-purple-700">Harvest Date: {selectedBatch.date}</p>
                </div>
                <div className="bg-orange-50 rounded-xl p-4">
                  <h3 className="font-semibold text-orange-900">Current Status</h3>
                  <p className="text-lg font-bold text-orange-600">{selectedBatch.status}</p>
                  <p className="text-sm text-orange-700">Last Updated: 2 hours ago</p>
                </div>
              </div>
            </div>

            {/* Traceability Timeline */}
            <div className="bg-gray-50 rounded-xl p-6">
              <h3 className="text-lg font-bold text-gray-900 mb-4">Traceability Timeline</h3>
              <div className="space-y-4">
                {[
                  { stage: 'Farm Registration', date: '2024-01-10', status: 'Completed' },
                  { stage: 'Sowing Recorded', date: '2024-01-11', status: 'Completed' },
                  { stage: 'Growth Monitoring', date: '2024-01-12', status: 'Completed' },
                  { stage: 'Harvest Completed', date: '2024-01-15', status: 'Completed' },
                  { stage: 'Quality Testing', date: '2024-01-15', status: 'Completed' },
                  { stage: 'Storage Entry', date: '2024-01-16', status: 'In Progress' }
                ].map((step, index) => (
                  <div key={index} className="flex items-center space-x-4">
                    <div className={`w-4 h-4 rounded-full ${
                      step.status === 'Completed' ? 'bg-green-500' : 'bg-yellow-500'
                    }`}></div>
                    <div className="flex-1">
                      <p className="font-semibold text-gray-900">{step.stage}</p>
                      <p className="text-sm text-gray-600">{step.date}</p>
                    </div>
                    <span className={`px-2 py-1 rounded-full text-xs font-bold ${
                      step.status === 'Completed' ? 'bg-green-100 text-green-800' : 'bg-yellow-100 text-yellow-800'
                    }`}>
                      {step.status}
                    </span>
                  </div>
                ))}
              </div>
            </div>
            
            <div className="mt-6 flex space-x-4">
              <button className="flex-1 bg-gradient-to-r from-purple-500 to-blue-500 text-white py-3 px-6 rounded-xl hover:from-purple-600 hover:to-blue-600 transition-all duration-300 font-semibold">
                View Blockchain Record
              </button>
              <button className="flex-1 bg-gray-100 text-gray-700 py-3 px-6 rounded-xl hover:bg-gray-200 transition-all duration-300 font-semibold">
                Download Certificate
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}