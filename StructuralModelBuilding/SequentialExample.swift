import TensorFlow
import StructuralCore
import PenguinStructures

/// A simple model, where we don't have to write `callAsFunction`, thanks to `SequentialLayer`.
public struct MyModel: Module, Layer, SequentialLayer {
    public var conv = Conv2D<Float>(filterShape: (5, 5, 3, 6))
    public var pool = MaxPool2D<Float>(poolSize: (2, 2), strides: (2, 2))
    public var flatten = Flatten<Float>()
    public var dense = Dense<Float>(inputSize: 36 * 6, outputSize: 10)
}

public struct MyModelSkipping: Module, Layer, SequentialLayer {
    public var conv = Conv2D<Float>(filterShape: (5, 5, 3, 6))
    public var pool = MaxPool2D<Float>(poolSize: (2, 2), strides: (2, 2))
    public var flatten = Flatten<Float>()
    @SequentialSkip(passing: Type<Tensor<Float>>()) var denseSkipped = Dense<Float>(inputSize: 1, outputSize: 2)
    public var dense = Dense<Float>(inputSize: 36 * 6, outputSize: 10)
}

public struct MyResidualModel: Module, Layer, SequentialLayer {
    public var conv = Conv2D<Float>(filterShape: (5, 5, 3, 6))
    public var pool = MaxPool2D<Float>(poolSize: (2, 2), strides: (2, 2))
    public var flatten = Flatten<Float>()
    @ResidualConnection var denseSkipped = Dense<Float>(inputSize: 36 * 6, outputSize: 36 * 6)
    public var dense = Dense<Float>(inputSize: 36 * 6, outputSize: 10)
}

// Below should be (eventually) auto-generated by the Swift compiler.

extension MyModel: DifferentiableStructural {
    // TODO: figure out why these didn't get automatically inferred.
    public typealias Input = Tensor<Float>
    public typealias Output = Tensor<Float>
    public typealias SequentialInput = Input
    public typealias SequentialOutput = Output

    public typealias StructuralRepresentation =
        StructuralStruct<
            StructuralCons<StructuralProperty<Conv2D<Float>>,
            StructuralCons<StructuralProperty<MaxPool2D<Float>>,
            StructuralCons<StructuralProperty<Flatten<Float>>,
            StructuralCons<StructuralProperty<Dense<Float>>,
            StructuralEmpty>>>>>

    @differentiable
    public init(differentiableStructuralRepresentation: StructuralRepresentation) {
        fatalError()
    }

    @derivative(of: init(differentiableStructuralRepresentation:))
    public static func _vjp_init(differentiableStructuralRepresentation: StructuralRepresentation)
    -> (value: Self, pullback: (TangentVector) -> StructuralRepresentation.TangentVector)
    {
        fatalError()
    }

    @differentiable
    public var differentiableStructuralRepresentation: StructuralRepresentation {
        fatalError()
    }

    @derivative(of: differentiableStructuralRepresentation)
    public func _vjp_differentiableStructuralRepresentation()
    -> (value: StructuralRepresentation, pullback: (StructuralRepresentation.TangentVector) -> TangentVector)
    {
        fatalError()
    }
}

extension MyModelSkipping: DifferentiableStructural {
    // TODO: figure out why these didn't get automatically inferred.
    public typealias Input = Tensor<Float>
    public typealias Output = Tensor<Float>
    public typealias SequentialInput = Input
    public typealias SequentialOutput = Output

    public typealias StructuralRepresentation =
        StructuralStruct<
            StructuralCons<StructuralProperty<Conv2D<Float>>,
            StructuralCons<StructuralProperty<MaxPool2D<Float>>,
            StructuralCons<StructuralProperty<Flatten<Float>>,
            StructuralCons<StructuralProperty<SequentialSkip<Dense<Float>, Tensor<Float>>>,
            StructuralCons<StructuralProperty<Dense<Float>>,
            StructuralEmpty>>>>>>

    @differentiable
    public init(differentiableStructuralRepresentation: StructuralRepresentation) {
        fatalError()
    }

    @derivative(of: init(differentiableStructuralRepresentation:))
    public static func _vjp_init(differentiableStructuralRepresentation: StructuralRepresentation)
    -> (value: Self, pullback: (TangentVector) -> StructuralRepresentation.TangentVector)
    {
        fatalError()
    }

    @differentiable
    public var differentiableStructuralRepresentation: StructuralRepresentation {
        fatalError()
    }

    @derivative(of: differentiableStructuralRepresentation)
    public func _vjp_differentiableStructuralRepresentation()
    -> (value: StructuralRepresentation, pullback: (StructuralRepresentation.TangentVector) -> TangentVector)
    {
        fatalError()
    }
}

extension MyResidualModel: DifferentiableStructural {
    // TODO: figure out why these didn't get automatically inferred.
    public typealias Input = Tensor<Float>
    public typealias Output = Tensor<Float>
    public typealias SequentialInput = Input
    public typealias SequentialOutput = Output

    public typealias StructuralRepresentation =
        StructuralStruct<
            StructuralCons<StructuralProperty<Conv2D<Float>>,
            StructuralCons<StructuralProperty<MaxPool2D<Float>>,
            StructuralCons<StructuralProperty<Flatten<Float>>,
            StructuralCons<StructuralProperty<ResidualConnection<Dense<Float>>>,
            StructuralCons<StructuralProperty<Dense<Float>>,
            StructuralEmpty>>>>>>

    @differentiable
    public init(differentiableStructuralRepresentation: StructuralRepresentation) {
        fatalError()
    }

    @derivative(of: init(differentiableStructuralRepresentation:))
    public static func _vjp_init(differentiableStructuralRepresentation: StructuralRepresentation)
    -> (value: Self, pullback: (TangentVector) -> StructuralRepresentation.TangentVector)
    {
        fatalError()
    }

    @differentiable
    public var differentiableStructuralRepresentation: StructuralRepresentation {
        fatalError()
    }

    @derivative(of: differentiableStructuralRepresentation)
    public func _vjp_differentiableStructuralRepresentation()
    -> (value: StructuralRepresentation, pullback: (StructuralRepresentation.TangentVector) -> TangentVector)
    {
        fatalError()
    }
}
